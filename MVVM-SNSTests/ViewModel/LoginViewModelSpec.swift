//
//  LoginViewModelSpec.swift
//  MVVM-SNSTests
//
//  Created by A on 04/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import MVVM_SNS

class LoginViewModelSpec: QuickSpec {
  override func spec() {
    var viewModel: LoginViewModel!
    
    beforeEach {
      viewModel = LoginViewModel()
    }

    describe("Login Error type") {
      it("Compare same type and parameter") {
        // Asset
        expect(LoginViewModel.ErrorType.email("A") == LoginViewModel.ErrorType.email("A")).to(beTrue())
      }

      it("Compare the same type and other parameter") {
        // Asset
        expect(LoginViewModel.ErrorType.email("A") == LoginViewModel.ErrorType.email("B")).to(beTrue())
      }

      it("Compare the same parameter and other type") {
        // Asset
        expect(LoginViewModel.ErrorType.email("A") == LoginViewModel.ErrorType.password("B")).to(beFalse())
      }
    }

    describe("Init state") {
      it("Empty error") {
        // Assert
        expect(viewModel.error.count).to(equal(0))
      }
      
      it("Logined") {
        // Asset
        expect(viewModel.isLoggedin).to(beFalse())
      }
    }

    describe("Login") {
      context("Typed email") {
        it("Wrong email") {
          // Act
          viewModel.email = "asd@"

          // Assert
          expect(viewModel.error).to(contain(LoginViewModel.ErrorType.email("")))
        }

        it("Valid email") {
          // Act
          viewModel.email = "asd"
          viewModel.email = "asd@example.com"

          // Assert
          expect(viewModel.error.count).to(equal(0))
        }

        it("Typed and Clear") {
          // Act
          viewModel.email = "asd@"
          viewModel.email = ""

          // Assert
          expect(viewModel.error.count).to(equal(0))
        }
      }

      context("login command") {
        it("Empty password field") {
          // Arrange
          viewModel.password = ""

          // Act
          viewModel.loginCommand.execute(Void())

          // Asset
          expect(viewModel.error).to(contain(LoginViewModel.ErrorType.password("")))
          expect(viewModel.isLoggedin).to(beFalse())
        }

        it("Empty email field") {
          // Arrange
          viewModel.email = ""

          // Act
          viewModel.loginCommand.execute(Void())
          
          // Asset
          expect(viewModel.error).to(contain(LoginViewModel.ErrorType.email("")))
          expect(viewModel.isLoggedin).to(beFalse())
        }

        it("Wrong email") {
          // Arrange
          viewModel.email = "asd"
          viewModel.password = "correct"

          // Act
          viewModel.loginCommand.execute(Void())
          
          // Asset
          expect(viewModel.error).to(contain(LoginViewModel.ErrorType.email("")))
          expect(viewModel.isLoggedin).to(beFalse())
        }

        it("Correct logined") {
          // Assign
          viewModel.email = "AA@example.com"
          viewModel.password = "a"

          // Act
          viewModel.loginCommand.execute(Void())

          // Asset
          expect(viewModel.isLoggedin).to(beTrue())
        }
      }
    }
  }
}
