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

// MARK: UIViewController Extension

extension UIViewController {
    
    // MARK: - UIStoryboard
    
    /**
     Get Main storyboard reference
     
     - returns: UIStoryboard
     */
    class func getMainStoryboard() -> UIStoryboard {
        
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
    
    // MARK: - Remove view controller
    
    /**
     Removes the view controller that called this function of the superview and parent view controller
     */
    func removeViewController() {
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    // MARK: - Create Pop Ups
    
    /**
     Creates a classic OK alert with 1 button
     
     - parameter alertMessage: The message of the alert
     - parameter alertTitle: The title of the alert
     - parameter okTitle: The title of the button
     - parameter proceedCompletion: The method to execute when the ok button is pressed
     */
    func createDressyClassicOKAlertWith(alertMessage: String, alertTitle: String, okTitle: String, proceedCompletion: (() -> Void)?) {
        
        if let customAlert: CustomAlertController = self.storyboard?.instantiateViewController(withIdentifier: "customAlertViewControllerDressy") as? CustomAlertController {
            
            // add a gray view to darken the background
            let view: UIView = UIView(frame: self.view.frame)
            view.backgroundColor = .gray
            view.alpha = 0.4
            view.tag = 123
            self.navigationController?.view.addSubview(view)
            
            // set up custom alert
            customAlert.providesPresentationContextTransitionStyle = true
            customAlert.definesPresentationContext = true
            customAlert.modalPresentationStyle = UIModalPresentationStyle.custom
            customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            customAlert.alertTitle = alertTitle
            customAlert.alertMessage = alertMessage
            customAlert.buttonTitle = okTitle
            customAlert.completion = {
                
                view.removeFromSuperview()
                proceedCompletion?()
            }
            
            self.present(customAlert, animated: true, completion: nil)
        }
    }
    
    /**
     Creates a classic OK alert with 2 buttons
     
     - parameter alertMessage: The message of the alert
     - parameter alertTitle: The title of the alert
     - parameter okTitle: The title of the button
     - parameter cancelTitle: The title of the button
     - parameter proceedCompletion: The method to execute when the ok button is pressed
     */
    func createDressyClassicDialogueAlertWith(alertMessage: String, alertTitle: String, okTitle: String, cancelTitle: String, proceedCompletion: (() -> Void)?) {
        
        if let customAlert: CustomAlertController = self.storyboard?.instantiateViewController(withIdentifier: "customAlertViewControllerDressy2") as? CustomAlertController {
            
            // add a gray view to darken the background
            let view: UIView = UIView(frame: self.view.frame)
            view.backgroundColor = .gray
            view.alpha = 0.4
            view.tag = 123
            self.navigationController?.view.addSubview(view)
            
            // set up custom alert
            customAlert.providesPresentationContextTransitionStyle = true
            customAlert.definesPresentationContext = true
            customAlert.modalPresentationStyle = UIModalPresentationStyle.custom
            customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(customAlert, animated: true, completion: nil)
            customAlert.alertTitle = alertTitle
            customAlert.alertMessage = alertMessage
            customAlert.buttonTitle = okTitle
            customAlert.cancelButtonTitle = "Cancel"
            customAlert.completion = proceedCompletion
            customAlert.backgroundView = view
            
            customAlert.showAlert(title: alertTitle, message: alertMessage, actionTitle: okTitle, cancelButtonTitle: "Cancel", action: proceedCompletion)
        }
    }
}
