/**
* Copyright (C) 2019 Dataswift Ltd
*
* SPDX-License-Identifier: MPL2
*
* This file is part of the Hub of All Things project (HAT).
*
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, You can obtain one at http://mozilla.org/MPL/2.0/
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        
        self.initMainCoordinator()

        return true
    }
    
    private func initMainCoordinator() {
        
        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: UINavigationController())
        
        // tell the coordinator to take over control
        coordinator?.start()
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        let url = userActivity.webpageURL
        
        // 1
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb else {
            
            if url != nil {
                
                application.open(url!, options: [:], completionHandler: nil)
            }
            
            return false
        }
        
        return true
    }
    
    // MARK: - oAuth handler function
    
    /*
     Callback handler oAuth
     */
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        guard let urlHost: String = url.host else { return true }
            
        if urlHost.contains(Auth.localAuthHost) {
            
            self.loginURLReceived(url: url)
        } else if urlHost.contains(Auth.registration) {
            
            NotificationCenter.default.post(name: NSNotification.Name("registration"), object: url)
        }
        
        return true
    }
    
    private func loginURLReceived(url: URL) {
        
        let result: String? = KeychainManager.getKeychainValue(key: KeychainConstants.logedIn)
        if result == KeychainConstants.Values.expired {
            
            NotificationCenter.default.post(name: NSNotification.Name("reauthorisedUser"), object: url)
        } else {
            
            NotificationCenter.default.post(name: NSNotification.Name("notificationHandlerName"), object: url)
            
            KeychainManager.setKeychainValue(key: KeychainConstants.logedIn, value: KeychainConstants.Values.setTrue)
        }
    }
}
