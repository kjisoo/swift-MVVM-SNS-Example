//
//  ModelViewModelSpec.swift
//  ViewModelTests
//
//  Created by A on 29/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Quick
import Nimble

@testable import ViewModel

struct Model: Identifiable {
  typealias IDType = Int
  let id: IDType
  let name: String
}

class ModelViewModelSpec: QuickSpec {
  override func spec() {
    it("Sync two ViewModel") {
      // Arrange
      let expectation = self.expectation(description: "Next Model")
      expectation.expectedFulfillmentCount = 2
      let streamFactory = StreamFactory<Model>()
      let model = Model(id: 1, name: "First")
      let firstViewModel = ModelViewModel(streamFactory: streamFactory, id: model.id)
      let secondViewModel = ModelViewModel(streamFactory: streamFactory, id: model.id)
      _ = firstViewModel.modelObservable.subscribe(onNext: { (model) in
        if model.name == "Second" {
          expectation.fulfill()
        }
      })
      _ = secondViewModel.modelObservable.subscribe(onNext: { (model) in
        if model.name == "Second" {
          expectation.fulfill()
        }
      })
      
      // Act
      firstViewModel.emit(model: Model(id: 1, name: "Second"))
      
      // Assert
      self.waitForExpectations(timeout: 0.5)
    }
    
    it("If id is different, do not share it.") {
      // Arrange
      let expectation = self.expectation(description: "Next Model")
      expectation.expectedFulfillmentCount = 1
      let streamFactory = StreamFactory<Model>()
      let firstViewModel = ModelViewModel(streamFactory: streamFactory, id: Model(id: 1, name: "First").id)
      let secondViewModel = ModelViewModel(streamFactory: streamFactory, id: Model(id: 2, name: "First").id)
      _ = firstViewModel.modelObservable.subscribe(onNext: { (model) in
        if model.name == "Third" {
          expectation.fulfill()
        }
      })
      _ = secondViewModel.modelObservable.subscribe(onNext: { (model) in
        if model.name == "Second" {
          fail()
        }
      })
      
      // Act
      firstViewModel.emit(model: Model(id: 1, name: "Third"))
      
      // Assert
      self.waitForExpectations(timeout: 0.5)
    }
  }
}
