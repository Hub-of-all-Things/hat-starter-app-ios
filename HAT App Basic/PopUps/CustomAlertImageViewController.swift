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

/// A full screen alert `UIViewController` used when creating new HAT or when connecting plugs
class CustomAlertImageViewController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    
    ///An IBOutlet to handle the mainView `UIView`
    @IBOutlet private weak var mainView: UIView!
    ///An IBOutlet to handle the alertView `UIView`
    @IBOutlet private weak var alertView: UIView!
    ///An IBOutlet to handle the main, title, `UILabel`
    @IBOutlet private weak var titleLabel: UILabel!
    ///An IBOutlet to handle the message, this displays some generic information about the `error` or the new hat `UILabel`
    @IBOutlet private weak var messageLabel: UILabel!
    ///An IBOutlet to handle the main message `UILabel`, usually this is active only in `success` state and displays the hat address
    @IBOutlet private weak var mainMessageLabel: UILabel!
    ///An IBOutlet to handle the ok `UIButton`
    @IBOutlet private weak var okButton: UIButton!
    ///An IBOutlet to handle the image(checkmark or error) `UImageView`
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Variables
    
    /// An `UIVisualEffectView` in order to blur the background
    private var blurEffectView: UIVisualEffectView? = nil
    /// A function to execute when user taps the button
    var completion: (() -> Void)? = nil
    /// The status the response received from HAT. Defaults to `success`
    private var status: Status = .success
    
    // MARK: - Alert status
    
    /**
     The possible status of the response received from HAT.
     
     Cases are:
     - success
     - failure
     */
    enum Status {
        
        case success
        case failure
    }
    
    // MARK: - IBActions

    /**
     Dismisses the `CustomAlertImageViewController` and then executes any completion handler
     
     - parameter sender: The object that called this function
     */
    @IBAction func buttonAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: { [weak self] in
            
            self?.blurEffectView?.removeFromSuperview()
            self?.completion?()
        })
    }
    
    // MARK: - UIViewController Delegate
    
    /// Using `viewDidLoad` for some UI tweaking
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.alertView.layer.cornerRadius = 5
        self.okButton.layer.cornerRadius = 5
        self.view.isHidden = true
    }
    
    // MARK: - Setup

    /**
     Set up the view depending the status of the error
     
     - parameter presentingView: The view that going to present this alert
     - parameter status: The status of the error. Is it a `failure` or not?
     - parameter buttonTitle: The title to have on the button
     - parameter mainDescription: The main description to have on the screen
     - parameter secondaryDescription: The secondary, small lettered, description to have on the screen
     - parameter title: The title of the error
     - parameter buttonAction: A function to execute when user taps the button
     */
    private func setUpWith(presentingView: UIViewController, status: Status, buttonTitle: String?, mainDescription: String?, secondaryDescription: String?, title: String?, buttonAction: (() -> Void)?) {
        
        self.status = status
        self.setUpViewForStatus(status, buttonTitle: buttonTitle, mainDescription: mainDescription, secondaryDescription: secondaryDescription, title: title, buttonAction: buttonAction)
        self.animate(presentingView: presentingView.view)
    }
    
    /**
     Set's up the view according to the `status` of the error
     
     - parameter status: The status of the error. Is it a `failure` or not?
     - parameter buttonTitle: The title to have on the button
     - parameter mainDescription: The main description to have on the screen
     - parameter secondaryDescription: The secondary, small lettered, description to have on the screen
     - parameter title: The title of the error
     - parameter buttonAction: A function to execute when user taps the button
     */
    private func setUpViewForStatus(_ status: Status, buttonTitle: String?, mainDescription: String?, secondaryDescription: String?, title: String?, buttonAction: (() -> Void)?) {
        
        switch status {
        case .failure:
            
            self.imageView.image = UIImage(named: "errorConnecting")
            self.titleLabel.text = title ?? "Oh no!"
            self.okButton.setTitle(buttonTitle ?? "OK", for: .normal)
            self.messageLabel.text = secondaryDescription ?? "We ran into some technical trouble when creating your HAT PDA. Your information has not been taken. Please try again later!"
        default:
            
            self.imageView.image = UIImage(named: "successCheckmark")
            self.titleLabel.text = title ?? "Success!"
            self.okButton.setTitle(buttonTitle ?? "LOG ME IN", for: .normal)
            self.messageLabel.text = secondaryDescription ?? "Your HAT PDA with the following URL has been created"
            self.mainMessageLabel.text = mainDescription
        }
        
        self.completion = {
            
            buttonAction?()
        }
    }
    
    // MARK: - Add blur
    
    /**
     Adds blur in the background
     
     - parameter presentingView: The view that going to present this alert
     */
    private func addBlur(presentingView: UIView) {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = presentingView.bounds
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        presentingView.addSubview(blurEffectView!)
    }
    
    // MARK: - Animate
    
    /**
     Adds blur and animates the error screen
     
     - parameter presentingView: The view that going to present this alert
     */
    private func animate(presentingView: UIView) {
        
        self.addBlur(presentingView: presentingView)
        self.view.isHidden = false
        let size = self.view.systemLayoutSizeFitting(CGSize(width: UIScreen.main.bounds.width, height: 390), withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .defaultLow).height
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 0.2,
            options: .curveEaseInOut,
            animations: { [weak self] in
                
                guard let weakSelf = self else { return }
                
                let midY = UIScreen.main.bounds.midY
                weakSelf.view.frame = CGRect(x: 0, y: midY - (size / 2), width: UIScreen.main.bounds.width, height: size + 5)
                weakSelf.view.addShadow(color: .black, shadowRadius: 5, shadowOpacity: 0.5, width: 2, height: 5)
            },
            completion: nil)
    }
    
    // NARK: - Present view controller
    
    /**
     Presents the view depending the status of the error
     
     - parameter presentingView: The view that going to present this alert
     - parameter status: The status of the error. Is it a `failure` or not?
     - parameter buttonTitle: The title to have on the button
     - parameter mainDescription: The main description to have on the screen
     - parameter secondaryDescription: The secondary, small lettered, description to have on the screen
     - parameter title: The title of the error
     - parameter buttonAction: A function to execute when user taps the button
     */
    class func present(presentingView: UIViewController, status: Status, buttonTitle: String?, mainDescription: String?, secondaryDescription: String?, title: String?, buttonAction: (() -> Void)?, completion: ((CustomAlertImageViewController) -> Void)?) {

        let customImageAlert = CustomAlertImageViewController.instantiate()
        presentingView.present(customImageAlert, animated: true, completion: {
            
            customImageAlert.setUpWith(presentingView: presentingView, status: status, buttonTitle: buttonTitle, mainDescription: mainDescription, secondaryDescription: secondaryDescription, title: title, buttonAction: { buttonAction?() })
            completion?(customImageAlert)
        })
    }
}
