//
//  HomeViewController.swift
//  BetWorksLogin
//
//  Created by Habib Durodola on 2020-12-24.
//

import UIKit

class HomeViewController: UIViewController {

    var username: String?

    //MARK:- VIEWS
    let welcomeBackText : UITextView = {
        let textview = UITextView()
        textview.isScrollEnabled = false
        textview.isSelectable = false
        textview.text = "Welcome Back ...."
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()


    //MARK:- LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeBackText)
        setupAutoLayout()
        showUserName(user: username)
    }

    //MARK:- HANDLER

    fileprivate func showUserName(user : String?){
        let welcome = "Welcome Back !!"
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let welcomeQuote = NSAttributedString(string: welcome, attributes: attributes)

        let username = NSAttributedString(string: "\n\n\n\(user ?? "")", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue , NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
        let combination = NSMutableAttributedString()
        combination.append(welcomeQuote)
        combination.append(username)

        welcomeBackText.attributedText = combination

    }

}
