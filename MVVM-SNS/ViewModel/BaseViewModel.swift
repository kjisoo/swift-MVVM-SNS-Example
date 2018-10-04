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

extension Array where Element: Equatable {
  mutating func update(element: Element) {
    self.remove(element: element)
    self.append(element)
  }

  mutating func remove(element: Element) {
    self.removeAll { $0 == element }
  }
}

@objcMembers
class BaseViewModel: NSObject {
}
