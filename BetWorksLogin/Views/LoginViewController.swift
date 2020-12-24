//
//  LoginViewController.swift
//  BetWorksLogin
//
//  Created by Habib Durodola on 2020-12-24.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK:- VIEWS
    lazy var userNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "UserName "
        return textfield
    }()

    lazy var passwordTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password "
        return textField
    }()

    let loginBtn : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()



    //MARK:- LIFECYCLE METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupInvisibleNavigation()
        setupViews()
        setupAutoLayout()
        // Do any additional setup after loading the view.
    }

    //MARK:- HANDLERS

    fileprivate func setupViews(){
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginBtn)

    }
    fileprivate func setupInvisibleNavigation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

}
