//
//  BetWorksLoginTests.swift
//  BetWorksLoginTests
//
//  Created by Habib Durodola on 2020-12-24.
//

import XCTest
@testable import BetWorksLogin

class BetWorksLoginTests: XCTestCase {


    func testValidateUserNameWrongInput(){
        let loginModel = LoginModel(userName: "Durod", password: "pasww")
        let model = LoginModelView(loginCredentials: loginModel)
        XCTAssertEqual(model.validateInputLoginCredentials(), false)
    }

    func testValidateUserNameWithNumber(){
        let loginModel = LoginModel(userName: "Durodolahabib043", password: "Password12123")
        let model = LoginModelView(loginCredentials: loginModel)
        XCTAssertEqual(model.validateInputLoginCredentials(), true)
    }

    

}
