//
//  AppDelegate.swift
//  VNews
//
//  Created by Savvycom on 5/10/22.
//

import UIKit
import Router
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        navigationController.navigationBar.isHidden = true
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

