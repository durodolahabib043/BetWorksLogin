//
//  BetWorksLoginTests.swift
//  BetWorksLoginTests
//
//  Created by Habib Durodola on 2020-12-24.
//

import XCTest
@testable import BetWorksLogin

class BetWorksLoginTests: XCTestCase {

    let mockApiClient = MockApiClient()

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

    func testMockLogin(){
        let expectation = self.expectation(description: "login")
        mockApiClient.login(userName: "DurodolaHabib043", password: "password") { (loginResponse, error) in
            XCTAssertEqual(loginResponse?.username , "DurodolaHabib043" )
            expectation.fulfill()
        }
        callWait()
    }

    func callWait()  {
        self.waitForExpectations(timeout: 10) { (error) in
            guard error == nil else {
                XCTAssert(false)
                NSLog("Timeout Error.")
                return
            }
        }
    }
    

}
