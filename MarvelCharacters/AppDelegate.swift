//
//  AppDelegate.swift
//  MarvelCharacters
//
//  Created by Hasan on 27.03.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let characterListVC = CharacterListVC()
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        navigationController.viewControllers.append(characterListVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
