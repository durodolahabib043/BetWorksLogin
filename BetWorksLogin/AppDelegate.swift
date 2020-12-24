//
//  AppDelegate.swift
//  BetWorksLogin
//
//  Created by Habib Durodola on 2020-12-24.
//

import UIKit

class CommonNavigationContoller : UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()

        window?.rootViewController = CommonNavigationContoller(rootViewController: LoginViewController())
        return true
    }

}

