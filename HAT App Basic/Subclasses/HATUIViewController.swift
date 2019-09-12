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
import MessageUI
import SafariServices

// MARK: - Class

/// A subclass of UIViewController encapsulating side menu, pop up and safari methods to easier handle a lot of common scenarios in the other view controllers
internal class HATUIViewController: UIViewController, UserCredentialsProtocol, SafariDelegateProtocol, SFSafariViewControllerDelegate {
    
    // MARK: - Protocol variables
    
    /// An optional SFSafariViewController object for launching safari in cases such as login.
    var safariVC: SFSafariViewController?
    /// An optional LoadingScreenViewController to show pop ups
    var loadingPopUp: LoadingScreenViewController?
    /// An optional UIScrollView to handle the scroll amonst the HATUIViewControllers
    var hatUIViewScrollView: UIScrollView?
    /// An optional UITextField to point out the currently active field in order for the keyboard scroll to know the best position
    var activeField: UITextField?
    /// A flag to override the token check on viewDidLoad
    var overrideTokenCheck: Bool = false
    
    // MARK: - Variables
    
    /// The URL to be used from safari variable to connect to the internet
    var safariURL: URL?
    /// A boolean value to store if the keyboard is currently on screen or not
    private var isKeyboardShown: Bool = false
    /// A CGFloat value to store the keyboard size
    private var keyboardSize: CGFloat = 0
    // The keyboard Manager to handle the keyboard showing and hiding
    var keyboardManager = KeyboardManager()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.checkIfTokenExpired()
    }
    
    // MARK: - Dismiss pop up
    
    /**
     Dismisses the pop up with animation
     
     - parameter completion: A function to execute after the pop up has been dismissed
     */
    @objc
    func dismissPopUp(completion: (() -> Void)? = nil) {
        
        UIView.animate(
            withDuration: 0.2,
            animations: { [weak self] in
                
                guard let weakSelf = self else { return }
                weakSelf.loadingPopUp?.view.frame = CGRect(x: 0, y: weakSelf.view.bounds.maxY + 68, width: weakSelf.view.bounds.width, height: 48)
            },
            completion: { [weak self] _ in
                
                self?.loadingPopUp?.removeViewController()
                self?.loadingPopUp = nil
                completion?()
            }
        )
    }
    
    // MARK: - Check token
    
    /**
     Check if token has expired, if yes go to login
     */
    func checkIfTokenExpired() {
         
        guard !userToken.isEmpty else { return }
        
        if !self.overrideTokenCheck {
            
            HATLoginService.checkIfTokenExpired(
                token: userToken,
                expiredCallBack: tokenExpiredLogOut,
                tokenValidCallBack: {_ in return},
                errorCallBack: { [weak self] _, _, _, _ in
                    
                    self?.tokenExpiredLogOut()
                }
            )
        }
    }
    
    /**
     Token has expired, log user out and jump to log in screen
     */
    func tokenExpiredLogOut() {
        
        self.goToLogin()
    }
    
    // MARK: - Go to login
    
    /**
     Go to log in screen
     */
    private func goToLogin() {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            appDelegate.coordinator?.logOutUser()
        }
    }
    
    // MARK: - Safari related
    
    /**
     Dismisses safari when the login has been completed
     
     - parameter animated: Dismiss the view animated or not
     - parameter completion: An Optional function to execute upon completion
     */
    func dismissSafari(animated: Bool, completion: (() -> Void)?) {
        
        self.safariVC?.dismissSafari(animated: animated, completion: completion)
    }
    
    /**
     Opens safari for the specifed hat domain
     
     - parameter hat: The user's hat domain
     - parameter animated: Opens the view animated or not
     - parameter completion: An Optional function to execute upon completion
     */
    func openInSafari(url: String, animated: Bool, completion: (() -> Void)?) {
        
        self.safariVC = SFSafariViewController.openInSafari(url: url, on: self, animated: animated, completion: completion)
        self.safariVC?.delegate = self
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        
        NotificationCenter.default.post(name: NSNotification.Name("refreshAppStatus"), object: nil)
    }
    
    // MARK: - Textfield methods
    
    /**
     Function executed when the return key is pressed in order to hide the keyboard
     
     - parameter textField: The textfield that confronts to this function
     
     - returns: Bool
     */
    @objc
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
    
    // MARK: - Custom Alerts
    
    /**
     Creates a classic alert with 2 buttons
     
     - parameter alertMessage: The message of the alert
     - parameter alertTitle: The title of the alert
     - parameter cancelTitle: The title of the cancel button
     - parameter proceedTitle: The title of the proceed button
     - parameter proceedCompletion: The method to execute when the proceed button is pressed
     - parameter cancelCompletion: The method to execute when the cancel button is pressed
     */
    func createClassicAlertWith(alertMessage: String, alertTitle: String, cancelTitle: String, proceedTitle: String, proceedCompletion: @escaping () -> Void, cancelCompletion: @escaping () -> Void) {
        
        //change font
        let attrTitleString: NSAttributedString = NSAttributedString(
            string: alertTitle,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32)])
        let attrMessageString: NSAttributedString = NSAttributedString(
            string: alertMessage,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32)])
        
        // create the alert
        let alert: UIAlertController = UIAlertController(
            title: attrTitleString.string,
            message: attrMessageString.string,
            preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(
            title: proceedTitle,
            style: .default,
            handler: { (_: UIAlertAction) in
                
                proceedCompletion()
            }
        ))
        alert.addAction(UIAlertAction(
            title: cancelTitle,
            style: .cancel,
            handler: { (_: UIAlertAction) in
                
                cancelCompletion()
            }
        ))
        
        // present the alert
        self.present(alert, animated: true, completion: nil)
    }
}
