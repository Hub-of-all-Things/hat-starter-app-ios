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

import HAT_API_for_iOS

// MARK: Class

internal class LoginViewController: HATUIViewController, Storyboarded {
    
    // MARK: - Variables
    
    /// The login coordinator responsible for navigating back and forth
    weak var coordinator: HATLoginCoordinator?
    
    // MARK: - IBAction
    
    /**
     Sends user to the next view controller
     
     - parameter sender: The object that called this function
     */
    @IBAction func logInButton(_ sender: Any) {
        
        coordinator?.goToEnterDetailsScreen()
    }
    
    /**
     Sends user to the view controller responsible for creating a hat
     
     - parameter sender: The object that called this function
     */
    @IBAction func createAccountButtonAction(_ sender: Any) {
        
        coordinator?.startRegistrationFlow()
    }
    
    // MARK: - View Controller functions
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.setUpUI()
        self.changeStateToLoggedIn()
    }
    
    // MARK: - Setup UI
    
    /**
     Sets up the UI of this view controller. Hides the navigation bar and hides the back button
     */
    private func setUpUI() {
        
        // hide navigation bar
        self.navigationController?.navigationBar.isHidden = true
        
        // hide back button
        let item = UIBarButtonItem(title: " ", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = item
    }
    
    // MARK: - State management
    
    /**
     Changes the state of the app to logged in and goes to the SHE feed
     */
    private func changeStateToLoggedIn() {
        
        let isUserLoggedIn = coordinator?.checkIfUserIsLoggedIn() ?? false
        coordinator?.changeStateToUserIsLoggedIn(isUserLoggedIn)
    }
}
