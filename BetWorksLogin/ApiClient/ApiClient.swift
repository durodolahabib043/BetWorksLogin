//
//  ApiClient.swift
//  BetWorksLogin
//
//  Created by Habib Durodola on 2020-12-26.
//

import Foundation

struct LoginResponse: Codable {
    let isSuccessful: Bool
    let username: String
}
enum MockServiceError : Error {
    case loginError
}



protocol ApiClientProtocol {
    func login(userName:String , password : String, completionHandler: @escaping (LoginResponse? , _ error: Error?) -> Void)
}

class ApiClient : ApiClientProtocol {
    var errorMessage = ""
    func login(userName: String, password: String, completionHandler: @escaping (LoginResponse?, Error?) -> Void) {

        let url = URL(string: "www.baseurl")!
        var loginResponse: LoginResponse?
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200{
                do {
                    let login = try JSONDecoder().decode(LoginResponse.self, from: data)
                    loginResponse = login

                 } catch {
                       self.errorMessage = "error"
                 }
            }
            else if
                let response = response as? HTTPURLResponse,
                (400...500).contains(response.statusCode) {
                loginResponse = nil;

            }
            completionHandler(loginResponse! , MockServiceError.loginError)
        })
        task.resume()
    }

}
