//
//  LoginModelView.swift
//  BetWorksLogin
//
//  Created by Habib Durodola on 2020-12-24.
//

import UIKit


class LoginModelView {

    let loginModel : LoginModel?

    init(loginCredentials : LoginModel) {
        self.loginModel = loginCredentials
    }

    func validateInputLoginCredentials() -> Bool{
        guard let username = self.loginModel?.userName ,
              let password = self.loginModel?.password else {
            return false
        }
        let regex = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{12,}$")

        return  (regex.evaluate(with: username) && regex.evaluate(with: password) )
    }
}
