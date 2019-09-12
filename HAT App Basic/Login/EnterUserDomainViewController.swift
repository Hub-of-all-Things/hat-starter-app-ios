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

/// Responsible for enabling user to log in with `email` or `url`
internal class EnterUserDomainViewController: HATUIViewController, UITextFieldDelegate, Storyboarded {
    
    // MARK: - Variables
    
    /// The coordinator that enables the view to navigate back and forth
    weak var coordinator: HATLoginCoordinator?
    /// The selected cluster for the user
    private var selectedCluster: String = ".\(AppStatusManager.getCluster())"
    /// An adapter to take on formatting the view between the 2 states of the view (url and email)
    private var viewAnimator: LoginViewAnimator = LoginViewAnimator()
    /// A flag to check if the email the user typed is a valid email
    private var isEmailValid: Bool = false
    /// A flag to check if the url the user typed exists on hat and it's valid
    private var isUrlValid: Bool = false
    /// A variable to hold reference of a timer. Timer is used updater updating the cluster label and before launching safari
    private var timer: Timer?
    /// An activity indicator for displaying to the user that something is going on
    private var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - IBOutlets

    /// An IBOutlet for holding a reference to the textfield that user enters the hat address or email
    @IBOutlet private weak var inputTextField: UITextField!
    /// An IBOutlet for holding a reference to the cluster name label
    @IBOutlet private weak var clusterLabel: UILabel!
    /// An IBOutlet for holding a reference to the error message label inside the `bannerView`
    @IBOutlet private weak var errorMessageLabel: UILabel!
    /// An IBOutlet for holding a reference to the scrollView
    @IBOutlet private weak var scrollView: UIScrollView!
    /// An IBOutlet for holding a reference to the input container UIView
    @IBOutlet private weak var inputContainerView: UIView!
    /// An IBOutlet for holding a reference to the cluster container UIView
    @IBOutlet private weak var clusterContainerView: UIView!
    /// An IBOutlet for holding a reference to the error banner UIView
    @IBOutlet private weak var bannerView: UIView!
    /// An IBOutlet for holding a reference to the next Button
    @IBOutlet private weak var nextButton: UIButton!
    /// An IBOutlet for holding a reference to the change log in method Button
    @IBOutlet private weak var changeLogInMethodButton: UIButton!
    /// An IBOutlet for holding a reference to the create account label
    @IBOutlet private weak var createAccountLabel: UILabel!
    /// An IBOutlet for holding a reference to the title label
    @IBOutlet private weak var titleLabel: UILabel!
    /// An IBOutlet for holding a reference to the login explanation label
    @IBOutlet private weak var logInExplanationLabel: UILabel!
    /// An IBOutlet for holding a reference to the vertical contraint of the email main label to the input view
    @IBOutlet private weak var emailVerticalConstraint: NSLayoutConstraint!
    /// An IBOutlet for holding a reference to the top contraint of the explanation label view
    @IBOutlet private weak var urlTopSpacingContraint: NSLayoutConstraint!
    /// An IBOutlet for holding a reference to the bottom contraint of the explanation label view
    @IBOutlet private weak var urlBottomSpacingConstraint: NSLayoutConstraint!
    /// An IBOutlet for holding a reference to the error banner height contraint
    @IBOutlet private weak var bannerViewHeightConstraint: NSLayoutConstraint!
    /// An IBOutlet for holding a reference to the width contraint of the cluster container view
    @IBOutlet private weak var clusterContainerWidthContraint: NSLayoutConstraint!
    /// An IBOutlet for holding a reference to the alternative, standard, contraint of the login explanation label. That is in order to avoid errors on the storyboard
    @IBOutlet private weak var alternativeExplanationLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: - IBActions
    
    /**
     Changes the view's state between email and URL
     
     - parameter sender: The object that called this function
     */
    @IBAction func changeLogInMethodAction(_ sender: Any) {
        
        viewAnimator.changeState(
            titleLabel: self.titleLabel,
            inputTextField: self.inputTextField,
            changeStateButton: self.changeLogInMethodButton,
            viewToAnimate: self.view,
            clusterContraint: self.clusterContainerWidthContraint,
            explanationLabel: self.logInExplanationLabel,
            explanationLabelTopContraint: self.urlTopSpacingContraint,
            explanationLabelBottomContraint: self.urlBottomSpacingConstraint,
            loginWithEmailBottomConstraint: self.emailVerticalConstraint,
            alternativeExplanationLabelTopConstraint: self.alternativeExplanationLabelTopConstraint,
            clusterLabel: self.clusterLabel)
        
        self.isUrlValid = false
        self.isEmailValid = false
        self.addToolbarAutofillButton()
    }
    
    /**
     Starts the process of logging in the user

     - parameter sender: The object that called this function
     */
    @IBAction func loginButtonAction(_ sender: Any) {

        if self.isEmailValid {
            
            NetworkManager.checkIfEmailExistsForLogin(
                self.inputTextField.text ?? "",
                isHatInSandbox: true,
                completionHandler: hatFound,
                failHandler: errorCheckingForHAT)
            
            self.activityIndicator = self.viewAnimator.startActivityIndicator(nextButton: self.nextButton)
        } else if self.isUrlValid {
            
            NetworkManager.checkIfHatDomainExistsForLogin(
                self.inputTextField.text ?? "",
                isHatInSandbox: true,
                completionHandler: hatFound,
                failHandler: errorCheckingForHAT)
            
            self.activityIndicator = self.viewAnimator.startActivityIndicator(nextButton: self.nextButton)
        } else if self.viewAnimator.currentState() == "email" {
            
            self.viewAnimator.showBanner(self.bannerView, label: self.errorMessageLabel, bannerConstraint: self.bannerViewHeightConstraint, text: "Email is not valid", mainView: self)
        } else if !self.isUrlValid {
            
            let message = HatCreationErrorConstants.errorMessages[self.inputTextField.text!.validateURL()!]
            self.viewAnimator.showBanner(self.bannerView, label: self.errorMessageLabel, bannerConstraint: self.bannerViewHeightConstraint, text: message ?? "Something went wrong", mainView: self)
        }
    }

    // MARK: - View Controller functions

    override func viewDidLoad() {

        self.overrideTokenCheck = true
        super.viewDidLoad()
    }
    
    /**
     Using it to initiate the setup of the view before the view does appear
     */
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.setupView()
    }
    
    // MARK: - Setup View
    
    /**
     Sets up view elemets
     */
    private func setupView() {
        
        self.nextButton.layer.cornerRadius = 5
        self.changeLogInMethodButton.layer.cornerRadius = 5

        self.keyboardManager.view = self.view
        self.keyboardManager.hatUIViewScrollView = self.scrollView
        self.keyboardManager.addKeyboardHandling()
        self.keyboardManager.hideKeyboardWhenTappedAround()
        
        self.addToolbarAutofillButton()
        self.formatCreateAccountLabel()
        
        self.inputContainerView.addBorder(width: 1, color: .hatDisabled)
        self.clusterContainerView.addBorder(width: 1, color: .hatDisabled)
        self.changeLogInMethodButton.addBorder(width: 1, color: .selectionColor)
        
        // add notification observer for the login in
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.hatLoginAuth),
            name: NSNotification.Name("notificationHandlerName"),
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.userCancelledSafari),
            name: NSNotification.Name("refreshAppStatus"),
            object: nil)

        self.inputTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    /**
     Adds a `UIToolbar` above the keyboard when user types something in the `UITextField`. This is to autocomplete a previous entry. Used for faster login
     */
    private func addToolbarAutofillButton() {
        
        let state = self.viewAnimator.currentState()
        let toolbar: UIToolbar?
        if state == "email" {
            
            toolbar = UIToolbar.createToolBar(userDomain: self.userEmail, width: self.view.frame.width, viewController: self, selector: #selector(self.autofillPHATA))
        } else {
            
            toolbar = UIToolbar.createToolBar(userDomain: self.userDomain, width: self.view.frame.width, viewController: self, selector: #selector(self.autofillPHATA))
        }
        
        self.inputTextField.inputAccessoryView = toolbar
        self.inputTextField.inputAccessoryView?.backgroundColor = .black
        self.inputTextField.delegate = self
    }
    
    // MARK: - Accesory Input View Method
    
    /**
     Fills the domain text field with the user's domain
     */
    @objc
    private func autofillPHATA() {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let weakSelf = self, weakSelf.userDomain != "" else { return }
            
            if weakSelf.viewAnimator.currentState() == "email" {
                
                weakSelf.inputTextField.text = String(describing: weakSelf.userEmail)
                weakSelf.isEmailValid = (weakSelf.inputTextField.text ?? "").isValidEmail()
            } else {
                
                let substrings = weakSelf.userDomain.split(separator: ".")
                weakSelf.inputTextField.text = String(describing: substrings[0])
                weakSelf.viewAnimator.updateSelectedClusterLabel(weakSelf.clusterLabel, labelWidthConstraint: weakSelf.clusterContainerWidthContraint, text: ".\(String(describing: substrings[1])).\(String(describing: substrings[2]))", viewToAnimate: weakSelf.view)
                weakSelf.selectedCluster = ".\(String(describing: substrings[1])).\(String(describing: substrings[2]))"
                weakSelf.isUrlValid = (weakSelf.userDomain).validateURL() != nil
            }
            
            weakSelf.inputTextField.font = UIFont.systemFont(ofSize: 14)
            weakSelf.loginButtonAction(weakSelf)
        }
    }
    
    // MARK: - Authorisation functions

    /**
     Takes the notification that the user can be logged in in order to start the authentication process

     - parameter notification: The notification received from the login precedure.
     */
    @objc
    private func hatLoginAuth(notification: NSNotification) {

        // get the url form the auth callback
        guard let url: URL = notification.object as? URL else { return }

        /**
         User has been logged in successfully. Close any pop ups, update the variables in the keychain and continue to the main app
         
         - parameter userDomain: User's userdomain as received from the back end
         - parameter token: The token received from the back end
         */
        func success(userDomain: String?, token: String?) {

            self.dismissPopUp()
            KeychainManager.setKeychainValue(key: KeychainConstants.userToken, value: token)
            KeychainManager.setKeychainValue(key: KeychainConstants.hatDomainKey, value: userDomain)
            if self.viewAnimator.currentState() == "email" {
                
                KeychainManager.setKeychainValue(key: KeychainConstants.userEmail, value: self.inputTextField.text)
            }
            self.coordinator?.changeStateToUserIsLoggedIn(true, completion: { [weak self] in
                
                self?.dismissSafari(animated: true, completion: nil)
            })
        }

        /**
         Log in failed. There was an error. Inform user of the fact
         
         - parameter error: The error received by the back end
         */
        func failed(error: AuthenicationError) {

            // first of all, we close the safari vc
            self.dismissSafari(animated: true, completion: nil)
            self.dismissPopUp()
            
            self.createDressyClassicOKAlertWith(
                alertMessage: error.localizedDescription,
                alertTitle: "Login failed",
                okTitle: "OK",
                proceedCompletion: {})
        }
        
        HATLoginService.loginToHATAuthorization(
            applicationName: Auth.serviceName,
            url: url as NSURL,
            success: success,
            failed: failed)
    }
    
    /**
     Takes the notification that the user has cancelled safari during log in process
     
     - parameter notification: The notification received from the login precedure.
     */
    @objc
    private func userCancelledSafari(notification: NSNotification) {
        
        guard self.activityIndicator != nil else { return }
        self.viewAnimator.stopActivityIndicator(self.activityIndicator!, nextButton: self.nextButton)
        self.activityIndicator = nil
    }
    
    /**
     Executed after the `Timer` has been fired. Opens safari in order for the user to enter password.
     
     - parameter timer: The `Timer` that called this method. I need a reference to access the `userInfo` of the `Timer`. It has the full `userDomain` as a `String`
     */
    @objc
    private func clusterLabelUpdated(_ timer: Timer) {
        
        KeychainManager.setKeychainValue(key: KeychainConstants.logedIn, value: KeychainConstants.Values.setFalse)
        self.openInSafari(url: Auth.hatLoginURL(userDomain: timer.userInfo as! String), animated: true, completion: nil)
    }
    
    // MARK: - Text Field delegate
    
    /**
     Used in order to update the button state on each letter entry by the user
     */
    @objc
    private func textFieldDidChange() {
        
        self.viewAnimator.hideBanner(bannerView, label: self.errorMessageLabel, bannerConstraint: bannerViewHeightConstraint, mainView: self.view)
        
        if self.viewAnimator.currentState() == "email" {
            
            self.isEmailValid = (self.inputTextField.text ?? "").isValidEmail()
        } else {
            
            self.isUrlValid = (self.inputTextField.text ?? "").validateURL() == nil
        }
    }
    
    /**
     Using it to set up some variables needed for scrolling the view in order for the keyboard to show
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.activeField = textField
        self.hatUIViewScrollView = self.scrollView
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.loginButtonAction(self)
        return true
    }
    
    // MARK: - HAT found / not found
    
    /**
     Hat with that `email` or `username` has been found. Update the cluster and log user in. The timer is to add one second delay. Product requirment.
     
     - parameter result: It contains the `hatName` and `hatCluster` of the user
     */
    private func hatFound(result: [String: Any]) {
        
        let name = (result["hatName"] as? String) ?? ""
        let cluster = (result["hatCluster"] as? String) ?? ""
        
        guard self.viewAnimator.currentState() == "url" else {
            
            self.timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(clusterLabelUpdated(_:)), userInfo: "\(name).\(cluster)", repeats: false)
            return
        }
        
        self.viewAnimator.updateSelectedClusterLabel(self.clusterLabel, labelWidthConstraint: self.clusterContainerWidthContraint, text: ".\(cluster)", viewToAnimate: self.view)
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clusterLabelUpdated(_:)), userInfo: "\(name).\(cluster)", repeats: false)
        self.viewAnimator.stopActivityIndicator(activityIndicator!, nextButton: self.nextButton)
    }
    
    /**
     Hat with that `email` or `username` was **NOT** found. Display message to user
     
     - parameter error: The error usually contains a `message` and a `cause` to help identifying the error
     */
    private func errorCheckingForHAT(error: [String: Any]) {
        
        let message = error["cause"] as? String
        self.viewAnimator.showBanner(self.bannerView, label: self.errorMessageLabel, bannerConstraint: self.bannerViewHeightConstraint, text: message ?? "General Error", mainView: self)
        
        self.viewAnimator.stopActivityIndicator(activityIndicator!, nextButton: self.nextButton)
    }
    
    // MARK: - Update UILabels
    
    /**
     Formats the create account label. The `Create account` has to be blue and the user has to be able to tap it in order to go to the registration flow
     */
    private func formatCreateAccountLabel() {
        
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.selectionColor]
        let attributedString = NSMutableAttributedString(string: "Don’t have an account? Create one\n")
        attributedString.addAttributes(attributes, range: NSRange(location: 23, length: 10))
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(createLabelTapped))
        tapGesture.numberOfTapsRequired = 1
        
        self.createAccountLabel.attributedText = attributedString
        self.createAccountLabel.isUserInteractionEnabled = true
        self.createAccountLabel.addGestureRecognizer(tapGesture)
    }
    
    /**
     Navigates to the registration flow
     */
    @objc
    private func createLabelTapped() {
        
        self.coordinator?.goBack()
        self.coordinator?.startRegistrationFlow()
    }
}
