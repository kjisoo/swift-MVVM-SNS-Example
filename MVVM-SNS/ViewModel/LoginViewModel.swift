//
//  LoginViewModel.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

enum LoginErrorType: Equatable {
  case email(String)
  case password(String)
  
  static func ==(lhs: LoginErrorType, rhs: LoginErrorType) -> Bool {
    switch (lhs, rhs) {
    case (.email, .email):
      return true
    case (.password, .password):
      return true
    default:
      return false
    }
  }
}

class LoginViewModel: BaseViewModel, ErrorPropagative {
  typealias ErrorType = LoginErrorType

  // Properties
  private(set) var error: [LoginErrorType] = []

  // Dynamic Properties
  dynamic var email = "" {
    didSet {
      if email.isEmpty {
        self.error.remove(element: .email(""))
      } else {
        self.updateEmailValidation()
      }
    }
  }
  dynamic var password = ""
  dynamic var isLoggedin = false
  
  // MARK: Commands
  lazy var loginCommand = RelayCommand(execute: { [weak self] in
    self?.login()
  })

  // MARK: Private func
  private func login() {
    self.updateEmailValidation()
    self.updatePasswordValidation()
    self.isLoggedin = self.error.count == 0
  }
  
  private func updateEmailValidation() {
    let emailValidator = EmailValidator(email: self.email)

    if let reason = emailValidator.reason {
      self.error.update(element: .email(reason))
    } else {
      self.error.remove(element: .email(""))
    }
  }

  private func updatePasswordValidation() {
    if self.password.isEmpty {
      self.error.update(element: .password("Password can not be blank."))
    } else {
      self.error.remove(element: .password(""))
    }
  }
}
