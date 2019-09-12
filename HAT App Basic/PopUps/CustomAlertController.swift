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

internal class CustomAlertController: UIViewController, Storyboarded {

    // MARK: - Variables

    /// A function to execute on tapping the button on the alert view controller
    var completion: (() -> Void)?
    var alertTitle: String = ""
    var alertMessage: String = ""
    var buttonTitle: String = ""
    var cancelButtonTitle: String = ""
    var backgroundView: UIView?
    
    // MARK: - IBOutlets

    /// An IBOutlet for holding a reference to the title UILabel of the alert
    @IBOutlet private weak var titleLabel: UILabel!
    /// An IBOutlet for holding a reference to the message UILabel of the alert
    @IBOutlet private weak var messageLabel: UILabel!
    /// An IBOutlet for holding a reference to the button of the alert
    @IBOutlet private weak var button: UIButton!
    /// An IBOutlet for holding a reference to the alert UIView
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var cancelButton: UIButton!
    
    // MARK: - IBActions

    /**
     Dismisses the alert controller
     
     - parameter sender: The object that called this function
     */
    @IBAction func buttonAction(_ sender: Any) {

        self.backgroundView?.removeFromSuperview()
        self.dismiss(animated: true, completion: { [weak self] in
            
            self?.completion?()
        })
    }

    @IBAction func cancelButtonAction(_ sender: Any) {
        
        self.backgroundView?.removeFromSuperview()
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - View Controller methods

    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.alertView.layer.masksToBounds = true
        self.alertView.layer.cornerRadius = 5
        self.baseView.addShadow(color: .black, shadowRadius: 5, shadowOpacity: 0.7, width: 3, height: 0)
        self.setUpButtonWith(self.buttonTitle)
        self.setTitleLabel(self.alertTitle)
        self.setMessageLabel(self.alertMessage)
        self.setUpCancelButtonWith(self.cancelButtonTitle)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        self.titleLabel.sizeToFit()
        self.messageLabel.sizeToFit()
        let titleHeight = self.titleLabel.frame.height
        let messageHeight = self.messageLabel.frame.height
        
        let height: CGFloat
        if self.cancelButton != nil {

            height = titleHeight + messageHeight + 60 + 175
        } else {

            height = titleHeight + messageHeight + 159
        }
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 0.2,
            options: .curveEaseInOut,
            animations: { [weak self] in
            
                guard let weakSelf = self else { return }
                
                let midY = UIScreen.main.bounds.midY
                weakSelf.view.frame = CGRect(x: 0, y: midY - (height / 2), width: weakSelf.view.frame.width, height: height)
            },
            completion: nil)

        self.alertView.layer.cornerRadius = 5
    }
    
    // MARK: - Show alert

    /**
     Shows a custom alert view contoller
     
     - parameter title: The title of the alert
     - parameter message: The message of the alert
     - parameter actionTitle: The string to show in the button
     - parameter cancelButtonTitle: The string to show in the cancel button
     - parameter action: An action to execute on tap of the button
     */
    func showAlert(title: String, message: String, actionTitle: String, cancelButtonTitle: String = "", action: (() -> Void)?) {

        self.setTitleLabel(title)
        self.setMessageLabel(message)
        self.setUpButtonWith(actionTitle)
        self.setUpCancelButtonWith(cancelButtonTitle)
        self.completion = action
    }
    
    /**
     Sets the desired title in the alert, if it exists
     
     - parameter title: The desired title of the alert
     */
    func setTitleLabel(_ title: String) {
        
        guard self.titleLabel != nil else { return }
        
        self.titleLabel.text = title
    }
    
    /**
     Sets the desired description in the alert, if it exists
     
     - parameter message: The desired description of the alert
     */
    func setMessageLabel(_ message: String) {
        
        guard self.messageLabel != nil else { return }
            
        self.messageLabel.text = message
    }
    
    /**
     Sets the desired title in the ok button, if it exists
     
     - parameter actionTitle: The desired title in the ok button
     */
    func setUpButtonWith(_ actionTitle: String) {
        
        guard self.button != nil else { return }
            
        self.button.layer.cornerRadius = 5
        self.button.setTitle(actionTitle, for: .normal)
    }
    
    /**
     Sets the desired title in the cancel button, if it exists
     
     - parameter actionTitle: The desired title in the cancel button
     */
    func setUpCancelButtonWith(_ actionTitle: String) {
        
        guard self.cancelButton != nil else { return }
            
        self.cancelButton.setTitle(actionTitle, for: .normal)
    }

}
