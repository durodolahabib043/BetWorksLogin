//
//  BetWorksLoginUITests.swift
//  BetWorksLoginUITests
//
//  Created by Habib Durodola on 2020-12-24.
//

import XCTest

class BetWorksLoginUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }


    func testLogin(){

        let app = XCUIApplication()
        app.launch()
        let usernameTextField = app.textFields["UserName"]
        usernameTextField.tap()
        usernameTextField.typeText("DurodolaHabib043")

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("PasswordBet043")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.buttons["Login"].tap()

        XCTAssert((app.textViews.staticTexts["DurodolaHabib043"]).exists, "This is the username")
        
    }

}
