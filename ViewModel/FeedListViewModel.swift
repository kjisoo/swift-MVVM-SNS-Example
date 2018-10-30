//
//  FeedListViewModel.swift
//  MVVM-SNS
//
//  Created by A on 06/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

import Action
import RxSwift
import RxCocoa
import RxDataSources

import Model

public class FeedListViewModel: BaseViewModel {
  // MARK: Dynamic Properties
  dynamic var feeds: [FeedViewModel] = []
  
  // MARK: Commands
  // Action similar to ReactiveCommand.
  lazy var loadMoreAction = Action<Void, Void>(enabledIf: self.canLoadMore) { [weak self] (_) -> Observable<Void> in
    self?.loadMore()
    return Observable<Void>.never()
  }
  
  // MARK: Private properties
  private let feedService: FeedServiceType
  private let canLoadMore = BehaviorSubject<Bool>(value: true)
  private var nextPage = 0
  private let disposeBag = DisposeBag()
  
  init(feedService: FeedServiceType) {
    self.feedService = feedService
    super.init()
    loadMoreAction.execute(Void())
  }
  
  private func loadMore() {
    canLoadMore.onNext(false)
    self.feedService.posts(page: 1)
      .subscribe { [weak self] (event) in
        switch event {
        case .success(let posts):
          self?.feeds.append(contentsOf: posts.map({FeedViewModel(post: $0)}))
          self?.nextPage += 1
        case .error(_):
          break
        }
        self?.canLoadMore.onNext(true)
      }
      .disposed(by: self.disposeBag)
  }
}
