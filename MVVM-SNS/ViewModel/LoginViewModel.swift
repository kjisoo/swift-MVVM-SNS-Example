//
//  LoginViewModel.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel {
  // MARK: Dynamic Properties
  dynamic private(set) var error: Dictionary<String, String> = [:]
  dynamic private(set) var isLoggedin = false
  dynamic var email = "" {
    didSet {
      if email.isEmpty {
        self.error.removeValue(forKey: "email")
      } else {
        self.updateEmailValidation()
      }
    }
  }
  dynamic var password = ""
  
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
      self.error["email"] = reason

    } else {
      self.error.removeValue(forKey: "email")
    }
  }

  private func updatePasswordValidation() {
    if self.password.isEmpty {
      self.error["password"] = "Password can not be blank."
    } else {
      self.error.removeValue(forKey: "password")
    }
  }
}
