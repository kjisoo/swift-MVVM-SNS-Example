//
//  FeedViewModel.swift
//  MVVM-SNS
//
//  Created by A on 06/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

import RxSwift

import Model

public class FeedViewModel: ModelViewModel<Post> {
  static private let feedStreamFactory = StreamFactory<Post>()
  
  private let disposeBag = DisposeBag()
  
  dynamic var content = ""
  dynamic var contentImage: URL? = nil
  dynamic var userName = ""
  dynamic var like = 0
  dynamic var isLiked = false
  dynamic var comments: [CommentViewModel] = []
  
  init(post: Post) {
    super.init(streamFactory: FeedViewModel.feedStreamFactory, id: post.id)
    self.emit(model: post)
    
    self.modelObservable
      .subscribe(onNext: { [weak self] (post) in
        self?.content = post.content
        self?.contentImage = post.contentImageURL
        self?.userName = post.owner.name
        self?.like = post.likes.count
        self?.comments = []
      })
      .disposed(by: self.disposeBag)
  }
}
