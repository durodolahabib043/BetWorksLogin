//
//  Extensions.swift
//  BetWorksLogin
//
//  Created by Habib Durodola on 2020-12-24.
//

import UIKit

extension LoginViewController {

    func setupAutoLayout(){
        var constraints = [NSLayoutConstraint]()
        let prevNextView: [UIView] = [userNameTextField,passwordTextField,loginBtn]
        let fullStackView = UIStackView.init(arrangedSubviews: prevNextView)
        fullStackView.axis = .vertical
        fullStackView.alignment = .fill
        fullStackView.distribution = .fill
        fullStackView.spacing = 10
        fullStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(fullStackView)

        //MARK:- headerText
        constraints += [NSLayoutConstraint.init(item: headerText, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 100.0)]
        constraints += [NSLayoutConstraint.init(item: headerText, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 40.0)]
        constraints += [NSLayoutConstraint.init(item: headerText, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -40.0)]

        //MARK:- fullStackView
        //centerY fullStackView
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0.0)]
        // leading fullStackView
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 40.0)]
        // trailing fullStackView
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -40.0)]
        // height
        constraints += [NSLayoutConstraint.init(item: userNameTextField, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 1/12, constant: 0.0)]
        //width
        constraints += [NSLayoutConstraint.init(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: userNameTextField, attribute: .height, multiplier: 1.0, constant: 0.0)]

        view.addConstraints(constraints)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension LoginViewController {

    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("notification: Keyboard will show")
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height - 250
            }
        }

    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height - 250
            }
        }
    }

}


