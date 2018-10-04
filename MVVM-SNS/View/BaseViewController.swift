//
//  BaseViewController.swift
//  MVVM-SNS
//
//  Created by A on 04/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import UIKit

import RxSwift

class BaseViewController: UIViewController {
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.bind()
  }

  func bind() {}
}
