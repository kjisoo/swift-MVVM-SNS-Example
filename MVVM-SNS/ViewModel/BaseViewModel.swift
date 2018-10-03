//
//  BaseViewModel.swift
//  MVVM-SNS
//
//  Created by A on 2018. 10. 2..
//  Copyright © 2018년 Kimjisoo. All rights reserved.
//

import Foundation

protocol ErrorPropagative {
  associatedtype ErrorType: Equatable
  var error: [ErrorType] { get }
}

extension ErrorPropagative {
  func updatedError(error: ErrorType) -> [ErrorType] {
    return self.removedError(error: error) + [error]
  }

  func removedError(error: ErrorType) -> [ErrorType] {
    return self.error.filter({ $0 != error })
  }
}

@objcMembers
class BaseViewModel: NSObject {
}
