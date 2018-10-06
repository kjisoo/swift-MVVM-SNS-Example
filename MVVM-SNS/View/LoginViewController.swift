//
//  LoginViewController.swift
//  MVVM-SNS
//
//  Created by A on 04/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import UIKit

import RxObserve
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController {
  // For DI
  var viewModel: LoginViewModel!

  // IBOutlets
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var emailErrorLabel: UILabel!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var passwordErrorLabel: UILabel!
  @IBOutlet weak var confirmButton: UIButton!
  
  override func bind() {
    self.disposeBag.insert(
      // ViewModel to UI
      self.viewModel.rx.asObservable(keyPath: \.email)
        .bind(to: self.emailTextField.rx.text),
      
      self.viewModel.rx.asObservable(keyPath: \.password)
        .bind(to: self.passwordTextField.rx.text),
      
      self.viewModel.rx.asObservable(keyPath: \.error)
        .subscribe(onNext: { [weak self] (errors) in
          self?.emailErrorLabel.text = errors["email"]
          self?.passwordErrorLabel.text = errors["password"]
        }),

      self.viewModel.rx.asObservable(keyPath: \.isLoggedin)
        .filter { $0 }
        .subscribe(onNext: { [weak self] (_) in
          self?.performSegue(withIdentifier: "main", sender: nil)
        }),

      // UI to ViewModel
      self.emailTextField.rx.text
        .orEmpty
        .bind(to: self.viewModel.rx.asObserver(keyPath: \.email)),
      
      self.passwordTextField.rx.text
        .orEmpty
        .bind(to: self.viewModel.rx.asObserver(keyPath: \.password)),
      
      self.confirmButton.rx.tap
        .subscribe(onNext: { [weak self] in
          self?.viewModel.loginCommand.execute(Void())
        })
    )
  }
}
