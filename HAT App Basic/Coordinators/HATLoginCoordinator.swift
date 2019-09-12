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

class HATLoginCoordinator: Coordinator, CoordinatorDelegate {
    
    // MARK: - CoordinatorDelegate protocol Functions
    
    func didStart(coordinator: Coordinator) {
        
        delegate?.didStart(coordinator: coordinator)
        self.childCoordinators.append(coordinator)
    }
    
    func didFinish(coordinator: Coordinator) {
        
        guard !self.childCoordinators.isEmpty else { return }
        
        for (index, cor) in self.childCoordinators.enumerated() where type(of: cor) == type(of: coordinator) {
            
            self.childCoordinators.remove(at: index)
        }
    }

    // MARK: - CoordinatorDelegate protocol Variables
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: CoordinatorDelegate?
    
    // MARK: - Coordinator protocol Initializer

    required init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    // MARK: - Start Coordinator
    
    func start() {
       
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Stop Coordinator
    
    /**
     It stops the coordinator, removes all of the children and notifies the delegate of the fact
     */
    func stop() {
        
        self.childCoordinators.removeAll()
        delegate?.didFinish(coordinator: self)
    }
    
    // MARK: - Navigate
    
    /**
     Iniatiates EnterUserDomainViewController and pushes it to the navigationController
     */
    func goToEnterDetailsScreen(animated: Bool = true) {
        
        let vc = EnterUserDomainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: animated)
    }
    
    /**
     It goes back to EnterUserDomainViewController from SelectHATDomainTableViewController.
     */
    func goBack() {
        
        navigationController.popViewController(animated: true)
    }
    
    /**
     Starts the HatCreationCoordinator in order to start the registration flow. The coordinator is then added to childCoordinators
     */
    func startRegistrationFlow() {
        
        let registrationCoordinator = HatCreationCoordinator(navigationController: self.navigationController)
        registrationCoordinator.delegate = self
        registrationCoordinator.start()
        self.childCoordinators.append(registrationCoordinator)
    }
    
    // MARK: - Check if user is logged in
    
    /**
     Checks if the user is logged in
     
     - parameter loggedIn: If no value is provided it reads from keychain for flag `logedIn`
     
     - returns: True if user is logged in, false else
     */
    func checkIfUserIsLoggedIn(_ loggedIn: String? = KeychainManager.getKeychainValue(key: KeychainConstants.logedIn)) -> Bool {
        
        guard let isUserLoggedIn: String = loggedIn else { return false }
        
        if isUserLoggedIn == KeychainConstants.Values.setTrue { return true }
        
        return false
    }
    
    /**
     Logs user in if the parameter is true. Else does nothing.
     
     - parameter loggedIn: A boolean value indicating if the user should be logged in
     - parameter completion: A function to execute before stopping the current coordinator
     */
    func changeStateToUserIsLoggedIn(_ loggedIn: Bool, completion: (() -> Void)? = nil) {
        
        if loggedIn {
            
            // go to main view
            let mainViewCoordinator = MainViewCoordinator(navigationController: self.navigationController)
            completion?()
            delegate?.replaceCoordinator(self, with: mainViewCoordinator)
            self.stop()
        }
    }
    
}
