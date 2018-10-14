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

@testable import ViewModel

class LoginViewModelSpec: QuickSpec {
  override func spec() {
    var viewModel: LoginViewModel!
    
    beforeEach {
      viewModel = LoginViewModel()
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
          expect(viewModel.error["email"]).notTo(beNil())
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
          expect(viewModel.error["password"]).notTo(beNil())
          expect(viewModel.isLoggedin).to(beFalse())
        }
        
        it("Empty email field") {
          // Arrange
          viewModel.email = ""
          
          // Act
          viewModel.loginCommand.execute(Void())
          
          // Asset
          expect(viewModel.error["email"]).notTo(beNil())
          expect(viewModel.isLoggedin).to(beFalse())
        }
        
        it("Wrong email") {
          // Arrange
          viewModel.email = "asd"
          viewModel.password = "correct"
          
          // Act
          viewModel.loginCommand.execute(Void())
          
          // Asset
          expect(viewModel.error["email"]).notTo(beNil())
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
