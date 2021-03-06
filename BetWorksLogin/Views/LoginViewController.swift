//
//  LoginViewController.swift
//  BetWorksLogin
//
//  Created by Habib Durodola on 2020-12-24.


import UIKit

class LoginViewController: UIViewController , UITextFieldDelegate{

    //MARK:- VIEWS

    let headerText: UILabel = {
        let label = UILabel()
        label.text = "Welcome to FireFly!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    lazy var userNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .line
        textfield.placeholder = "UserName"
        textfield.backgroundColor = .lightGray
        textfield.delegate = self
        return textfield
    }()

    lazy var passwordTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.placeholder = "Password"
        textField.backgroundColor = .lightGray
        textField.delegate = self
        return textField
    }()

    let loginBtn : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal) 
        button.backgroundColor = UIColor().setUIColor(red: 52, green: 164, blue: 235)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()



    //MARK:- LIFECYCLE METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupInvisibleNavigation()
        setupViews()
        setupAutoLayout()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    //MARK:- HANDLERS
    fileprivate func setupViews(){
        view.addSubview(headerText)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginBtn)
    }
    fileprivate func setupInvisibleNavigation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

    @objc private func login(){
        let loginModel = LoginModelView(loginCredentials: LoginModel(userName: userNameTextField.text!, password: passwordTextField.text!))

        if (loginModel.validateInputLoginCredentials()){
           let mockLogin = MockApiClient()
            mockLogin.login(userName: userNameTextField.text!, password: passwordTextField.text!) { (loginResponse, error) in
                let username = self.userNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = (loginResponse?.username == username) ? true : false
                if (password) {
                    let homeVC = HomeViewController()
                    homeVC.username = loginResponse?.username
                    self.navigationController?.pushViewController(homeVC, animated: true)
                    return
                }
                self.showErrorMessage()
            }
        }
        else {
            showErrorMessage()
        }
    }

    //MARK:- DELEGATES
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }

}
