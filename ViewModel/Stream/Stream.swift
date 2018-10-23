//
//  Stream.swift
//  ViewModel
//
//  Created by A on 23/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation
import RxSwift

class Stream<Model: Identifiable> {
  private let streamFactory: StreamFactory<Model>
  private let subject = ReplaySubject<Model>.create(bufferSize: 1)

  let id: Model.IDType
  var hasObservers: Bool {
    return self.subject.hasObservers
  }

  init(streamFactory: StreamFactory<Model>, id: Model.IDType) {
    self.streamFactory = streamFactory
    self.id = id
  }

  func emit(model: Model) {
    subject.onNext(model)
  }
  
  func subscribe(observer: AnyObserver<Model>) -> Disposable {
    let disposable = self.subject.subscribe(observer)
    return Disposables.create {
      disposable.dispose()
      self.streamFactory.streamUnsubscribed(stream: self)
    }
  }
}

class StreamFactory<Model: Identifiable> {
  private var streams: [Model.IDType: Stream<Model>] = [:]
  
  func connect(id: Model.IDType) -> Stream<Model> {
    return self.getOrCreateStream(id: id)
  }
  
  func streamUnsubscribed(stream: Stream<Model>) {
    if stream.hasObservers == false {
      self.streams.removeValue(forKey: stream.id)
    }
  }
  
  private func getOrCreateStream(id: Model.IDType) -> Stream<Model> {
    if let stream = self.streams[id] {
      return stream
    } else {
      let stream = Stream(streamFactory: self, id: id)
      self.streams[id] = stream
      return stream
    }
  }
}

