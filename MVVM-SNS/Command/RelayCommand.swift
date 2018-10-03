//
//  RelayCommand.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation
import RxSwift

class RelayCommand<Parameter> {
  private var canExecuteClosure: (Parameter) -> Bool
  private var executeClosure: (Parameter) -> Void

  init(execute: @escaping (Parameter) -> Void,
       canExecute: @escaping (Parameter) -> Bool = { _ in true }) {
    self.executeClosure = execute
    self.canExecuteClosure = canExecute
  }

  func canExecute(_ parameter: Parameter) -> Bool {
    return self.canExecuteClosure(parameter)
  }

  func execute(_ parameter: Parameter) {
    if self.canExecute(parameter) {
      self.executeClosure(parameter)
    }
  }
}
