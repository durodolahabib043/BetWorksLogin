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

        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Login"].tap()

    }

}
