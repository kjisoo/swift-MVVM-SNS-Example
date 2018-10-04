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
    // ViewModel to UI
    self.viewModel.rx.asObservable(keyPath: \.email)
      .bind(to: self.emailTextField.rx.text)
      .disposed(by: self.disposeBag)
    
    self.viewModel.rx.asObservable(keyPath: \.password)
      .bind(to: self.passwordTextField.rx.text)
      .disposed(by: self.disposeBag)

    // TODO: RxCollectionType
//    self.viewModel.rx.asObservable(keyPath: \.error)
//      .subscribe(onNext: { [weak self] (errors) in
//        for error in errors {
//          switch error {
//          case .email(let text):
//            self?.emailErrorLabel.text = text
//          case .password(let text):
//            self?.passwordErrorLabel.text = text
//          }
//        }
//      })
//      .disposed(by: self.disposeBag)

    // UI to ViewModel
    self.emailTextField.rx.text
      .orEmpty
      .bind(to: self.viewModel.rx.asObserver(keyPath: \.email))
      .disposed(by: self.disposeBag)

    self.passwordTextField.rx.text
      .orEmpty
      .bind(to: self.viewModel.rx.asObserver(keyPath: \.password))
      .disposed(by: self.disposeBag)
  }
}
