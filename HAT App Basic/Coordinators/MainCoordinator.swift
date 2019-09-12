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

// MARK: Class

class MainCoordinator: Coordinator, CoordinatorDelegate {
    
    // MARK: - CoordinatorDelegate protocol functions
    
    func didStart(coordinator: Coordinator) {
        
        self.childCoordinators.append(coordinator)
    }
    
    func didFinish(coordinator: Coordinator) {
        
        for (index, cor) in self.childCoordinators.enumerated() where type(of: cor) == type(of: coordinator) {
            
            self.childCoordinators.remove(at: index)
        }
    }
    
    // MARK: - CoordinatorDelegate protocol Variables

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: CoordinatorDelegate?
    
    // MARK: - Coordinator functions
    
    required init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        
        let loginCoordinator = HATLoginCoordinator(navigationController: self.navigationController)
        loginCoordinator.delegate = self
        loginCoordinator.start()
        self.childCoordinators.append(loginCoordinator)
    }
    
    // MARK: - Log user out
    
    /**
     Logs user out and shows the log in screen. Removes all the childCoordinators, replaces the UIWindow and starts the MainCoordinator again
     */
    func logOutUser() {
        
        self.childCoordinators.removeAll()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            self.navigationController = UINavigationController()
            self.start()
            
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appDelegate.window?.rootViewController = self.navigationController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
    // MARK: - Replace coordinator
    
    /**
     Replaces an existing coordinator with a new one. It first removes the old coordinator, shows the navigation bar in case it was hidden and initiates the new coordinator. Last it adds it in childCoordinators
     
     - parameter coordinator: The coordinator to be replaced. Usually this coordinator will call this function
     - parameter newCoordinator: The new coordinator to be added
     */
    func replaceCoordinator(_ coordinator: Coordinator, with newCoordinator: Coordinator) {
        
        self.didFinish(coordinator: coordinator)
        self.navigationController.navigationBar.isHidden = false
        newCoordinator.navigationController = self.navigationController
        newCoordinator.delegate = self
        newCoordinator.start()
        self.childCoordinators.append(newCoordinator)
    }
}
