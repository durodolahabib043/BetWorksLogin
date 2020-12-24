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
        fullStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(fullStackView)
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0.0)]

        view.addConstraints(constraints)
    }
}
