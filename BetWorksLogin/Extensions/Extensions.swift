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
        //centerY
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0.0)]
        // leading
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 40.0)]
        // trailing
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -40.0)]
        // height
        constraints += [NSLayoutConstraint.init(item: userNameTextField, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 1/12, constant: 0.0)]
        //width
        constraints += [NSLayoutConstraint.init(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: userNameTextField, attribute: .height, multiplier: 1.0, constant: 0.0)]

        view.addConstraints(constraints)
    }
}
