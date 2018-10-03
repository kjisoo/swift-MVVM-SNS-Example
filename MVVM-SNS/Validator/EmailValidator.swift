//
//  EmailValidator.swift
//  MVVM-SNS
//
//  Created by A on 04/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

struct EmailValidator {
  static func validate(email: String) -> Bool {
    let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    return email.range(of: regex,
                       options: .regularExpression,
                       range: nil,
                       locale: nil) != nil
  }
}
