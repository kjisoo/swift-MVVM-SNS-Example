//
//  ModelViewModel.swift
//  ViewModel
//
//  Created by A on 29/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation
import RxSwift

class ModelViewModel<Model: Identifiable>: BaseViewModel {
  private let stream: Stream<Model>
  private let disposeBag = DisposeBag()
  private let modelObserver = PublishSubject<Model>()

  internal let modelObservable: Observable<Model>
  
  init(streamFactory: StreamFactory<Model>, model: Model) {
    self.stream = streamFactory.connect(id: model.id)
    self.stream.subscribe(observer: self.modelObserver.asObserver()).disposed(by: self.disposeBag)
    self.modelObservable = self.modelObserver.asObservable()
  }
  
  internal func emit(model: Model) {
    self.stream.emit(model: model)
  }
}
