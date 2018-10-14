//
//  EmailValidator.swift
//  MVVM-SNS
//
//  Created by A on 04/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

struct EmailValidator {
  let isValid: Bool
  let email: String
  let reason: String?

  private let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

  init(email: String) {
    self.email = email
    self.isValid = email.range(of: self.regex,
                               options: .regularExpression,
                               range: nil,
                               locale: nil) != nil
    
    if self.isValid == false {
      if email.isEmpty {
        self.reason = "Email can not be blank."
      } else {
        self.reason = "Email format is invalid."
      }
    } else {
      self.reason = nil
    }
  }
}
