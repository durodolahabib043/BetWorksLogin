//
//  MockApiClient.swift
//  BetWorksLoginUITests
//
//  Created by Habib Durodola on 2020-12-26.
//

import UIKit
class MockApiClient {
    var shouldReturnError = false
    var loginCalled = false

    func reset(){
        shouldReturnError = false
        loginCalled = false
    }

    convenience init() {
        self.init(false)
    }

    let mockLoginResponse = LoginResponse(isSuccessful: true, username: "DurodolaHabib043")

    init(_ shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }


}

extension MockApiClient : ApiClientProtocol {

    func login(userName: String, password: String, completionHandler: @escaping (LoginResponse?, Error?) -> Void) {
        if shouldReturnError  {
            completionHandler(nil, MockServiceError.loginError)
        } else {
            completionHandler(mockLoginResponse , nil)
        }
    }


}


