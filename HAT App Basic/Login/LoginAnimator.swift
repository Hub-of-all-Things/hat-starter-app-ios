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

// MARK: Struct

/// A struct to take care of changing the state of the `EnterUserDomainViewController` between `url` and `email`
struct LoginViewAnimator {
    
    // MARK: - Enum states
    
    /**
     The possible states of the viewController.
     
     Cases are:
     - email
     - url
     */
    private enum LoginState: String {
        
        case url
        case email
    }
    
    // MARK: - Variables
    
    /// A variable to store the current login state. Original state is the `email`
    private var loginState = LoginState.email
    
    // MARK: - Change login state
    
    /**
     Changes the state of the view. Ultimately this means changins some UI elements
     
     - parameter titleLabel: The main title of the view
     - parameter inputTextField: The input text that user will enter `email` or `userdomain`
     - parameter changeStateButton: The button that changes the state of the viewController between `email` and `url`
     - parameter viewToAnimate: The main view of the viewController that will animate the changes
     - parameter clusterContraint: The cluster container view height contraint in order to animate it from 0 to 48 and vice versa
     - parameter explanationLabel: The explanation login label. Log in might seem confusing so this is a must
     - parameter explanationLabelTopContraint: The top spacing contraint of the explanation label in order to animate it
     - parameter explanationLabelBottomContraint: The bottom spacing contraint of the explanation label in order to animate it
     - parameter loginWithEmailBottomConstraint: The bottom spacing contraint of the main title label in order to animate it
     - parameter alternativeExplanationLabelTopConstraint: The alternative top spacing contraint of the explanation label in order to animate it. We need this in order to avoid errors on the storyboard
     - parameter clusterLabel: The cluster label in order to animate it
     */
    mutating func changeState(titleLabel: UILabel, inputTextField: UITextField, changeStateButton: UIButton, viewToAnimate: UIView?, clusterContraint: NSLayoutConstraint, explanationLabel: UILabel, explanationLabelTopContraint: NSLayoutConstraint, explanationLabelBottomContraint: NSLayoutConstraint, loginWithEmailBottomConstraint: NSLayoutConstraint, alternativeExplanationLabelTopConstraint: NSLayoutConstraint, clusterLabel: UILabel) {
        
        switch loginState {
        case .url:
            
            clusterContraint.constant = 0
            titleLabel.text = "Log in with email"
            inputTextField.placeholder = "Enter your email"
            inputTextField.text = ""
            changeStateButton.setTitle("LOGIN IN WITH HAT URL", for: .normal)
            explanationLabel.isHidden = true
            explanationLabelTopContraint.isActive = false
            explanationLabelBottomContraint.isActive = false
            loginWithEmailBottomConstraint.isActive = true
            alternativeExplanationLabelTopConstraint.isActive = false
            clusterLabel.isHidden = true

            self.loginState = .email
        default:
            
            let width = (clusterLabel.text ?? "").calculateLabelWidth(maxHeight: 18, font: UIFont.systemFont(ofSize: 14))
            clusterContraint.constant = width + 16
            titleLabel.text = "Log in with HAT URL"
            inputTextField.placeholder = "Enter your name"
            inputTextField.text = ""
            changeStateButton.setTitle("LOG IN WITH EMAIL", for: .normal)
            explanationLabel.isHidden = false
            explanationLabelTopContraint.isActive = true
            explanationLabelBottomContraint.isActive = true
            loginWithEmailBottomConstraint.isActive = false
            alternativeExplanationLabelTopConstraint.isActive = true
            clusterLabel.isHidden = false
            
            self.loginState = .url
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            
            viewToAnimate?.layoutIfNeeded()
        })
    }
    
    // MARK: - Current State
    
    /**
     Returns the current state of the animator as a `String`
     
     - returns: The current state of the animator as a `String`
     */
    func currentState() -> String {
        
        return self.loginState.rawValue
    }
    
    // MARK: - Banner
    
    /**
     Shows banner with the correct `text` and animation
     
     - parameter banner: The banner `UIView` to show and animate
     - parameter label: The `UILabel` to show the error message
     - parameter bannerConstraint: The height constraint of the `banner`
     - parameter text: The `text` to update the selectedHATClusterLabel `UILabel` with
     - parameter mainView: The `UIView` that will animate the constraint changes
     */
    func showBanner(_ banner: UIView, label: UILabel, bannerConstraint: NSLayoutConstraint, text: String, mainView: UIViewController) {
        
        BannerView.showBanner(banner, label: label, bannerConstraint: bannerConstraint, text: text, mainView: mainView)
    }
    
    /**
     Hides the `banner` with animations from the `mainView`
     
     - parameter banner: The banner `UIView` to show and animate
     - parameter label: The `UILabel` to show the error message
     - parameter bannerConstraint: The height constraint of the `banner`
     - parameter mainView: The `UIView` that will animate the constraint changes
     */
    func hideBanner(_ banner: UIView, label: UILabel, bannerConstraint: NSLayoutConstraint, mainView: UIView) {
        
        BannerView.hideBanner(banner, label: label, bannerConstraint: bannerConstraint, mainView: mainView)
    }
    
    // MARK: - Update cluster label
    
    /**
     Updates the `text`, `color` and `font` of `selectedHATClusterLabel` `UILabel`. The `color` and `font` are hardcoded. The `text` is passed as parameter
     
     - parameter label: The `UILabel` to update and animate
     - parameter labelWidthConstraint: The width constraint of the `UILabel`. Needed for the animation
     - parameter text: The `text` to update the selectedHATClusterLabel `UILabel` with
     - parameter viewToAnimate: The main `UIView` that will animate the layout changes
     */
    func updateSelectedClusterLabel(_ label: UILabel, labelWidthConstraint: NSLayoutConstraint, text: String?, viewToAnimate: UIView) {
        
        label.text = text
        let width = (label.text ?? "").calculateLabelWidth(maxHeight: 18, font: UIFont.systemFont(ofSize: 14))
        labelWidthConstraint.constant = width + 30
        
        UIView.animate(withDuration: 0.2, animations: {
            
            viewToAnimate.layoutIfNeeded()
        })
    }
    
    // MARK: - Activity Indicator
    
    /**
     Creates an `UIActivityIndicatorView` and adds it as a subview to the button passed in. 
     
     - parameter nextButton: The next button. In order to remove the title
     
     - returns: An `UIActivityIndicatorView` already added to the button and animating. Hold reference to it in order to remove it later
     */
    func startActivityIndicator(nextButton: UIButton) -> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView()
        let buttonHeight = nextButton.bounds.size.height
        let buttonWidth = nextButton.bounds.size.width
        activityIndicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
        nextButton.addSubview(activityIndicator)
        nextButton.setTitle("", for: .normal)
        activityIndicator.startAnimating()
        
        return activityIndicator
    }
    
    /**
     Stops the activity Indicator and resets the button title to previous title
     
     - parameter activityIndicator: The activity indicator to stop animating and remove from parent view
     - parameter nextButton: The next button. In order to change the title to `NEXT`
     */
    func stopActivityIndicator(_ activityIndicator: UIActivityIndicatorView, nextButton: UIButton) {
        
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        nextButton.setTitle("NEXT", for: .normal)
    }
}
