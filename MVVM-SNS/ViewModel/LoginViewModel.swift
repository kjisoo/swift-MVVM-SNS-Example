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
  dynamic var error: [ErrorType] = []
  dynamic var email = "" {
    didSet {
      if self.email.isEmpty {
        self.error = self.removedError(error: .email(""))
      } else if EmailValidator.validate(email: self.email) == false {
        self.error = self.updatedError(error: .email("Wrong Email"))
      }
    }
  }
  dynamic var password = ""
  dynamic var isLogined = false
  
  // MARK: Commands
  lazy var loginCommand = RelayCommand(execute: { [weak self] in
    self?.login()
  })

  private func login() {
    if self.email.isEmpty {
      self.error = self.updatedError(error: .email("Email can not be blank."))
    } else if EmailValidator.validate(email: self.email) == false {
      self.error = self.updatedError(error: .email("Wrong Email"))
    } else {
      self.error = self.removedError(error: .email(""))
    }
    
    if self.password.isEmpty {
      self.error = self.updatedError(error: .password("Password can not be blank."))
    } else {
      self.error = self.removedError(error: .password(""))
    }
    
    self.isLogined = self.error.count == 0
  }
}
