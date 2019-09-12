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
import SafariServices

// MARK: Class

internal class ChooseHATAddressViewController: HATCreationUIViewController, SafariDelegateProtocol, SFSafariViewControllerDelegate {
    
    // MARK: - Safari Delegate Protocol - Variables
    
    var safariVC: SFSafariViewController?
    
    // MARK: - Safari Delegate Protocol - Functions
    
    func openInSafari(url: String, animated: Bool, completion: (() -> Void)?) {
        
        self.safariVC = SFSafariViewController.openInSafari(url: url, on: self, animated: animated, completion: completion)
        self.safariVC?.delegate = self
    }
    
    func dismissSafari(animated: Bool, completion: (() -> Void)?) {
        
        self.safariVC?.dismissSafari(animated: animated, completion: completion)
    }
    
    // MARK: - IBOutlets

    ///An IBOutlet to handle the hatAddress textField
    @IBOutlet private weak var hatAddressTextField: UITextField!
    ///An IBOutlet to handle the next Button
    @IBOutlet private weak var nextButton: UIButton!
    ///An IBOutlet to handle the selected cluster Label
    @IBOutlet private weak var selectedCluster: UILabel!
    /// An IBOutlet to controll the banner error message UILabel
    @IBOutlet private weak var bannerMessageLabel: UILabel!
    /// An IBOutlet for holding a reference to the error banner UIView
    @IBOutlet private weak var bannerView: UIView!
    /// An IBOutlet for holding a reference to the error banner height contraint
    @IBOutlet private weak var bannerHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    
    ///A referce to the customAlert in order to be able to present it and dismiss it
    private var customImageAlert: CustomAlertImageViewController?
    
    // MARK: - IBActions
    
    /**
     Called when next button is pressed. Check the fields for error and checks with hat the email field. If ok continues to the next screen
     
     - parameter sender: The object that called the function
     */
    @IBAction func nextButtonAction(_ sender: Any) {
        
        self.validateHATAddress()
    }
    
    // MARK: - View controller functions
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.hatAddressTextField.delegate = self
        self.hatAddressTextField.setLeftPaddingPoints(22)
        self.hatAddressTextField.layer.borderWidth = 1
        self.hatAddressTextField.layer.borderColor = UIColor.hatDisabled.cgColor
        // add a target if user is editing the text field
        self.hatAddressTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        self.nextButton.layer.cornerRadius = 5
        
        self.selectedCluster.text = ".\(self.cluster)"
        NotificationCenter.default.addObserver(self, selector: #selector(self.hatRegistrationCallback(notif:)), name: NSNotification.Name("registration"), object: nil)
    }
    
    // MARK: - Validate HAT Address
    
    /**
     Validates if the HAT address that user entered in the textfield is valid and can be used with the HAT
     */
    private func validateHATAddress() {
        
        let trimmedAddress: String = self.hatAddressTextField.text!.replacingOccurrences(of: " ", with: "")
        self.hatAddressTextField.text = trimmedAddress
        let address: String = trimmedAddress.replacingOccurrences(of: ".\(self.cluster)", with: "")
        
        let maybeError = address.validateURL()
        if maybeError != nil {
            
            BannerView.showBanner(
                self.bannerView,
                label: self.bannerMessageLabel,
                bannerConstraint: self.bannerHeightConstraint,
                text: HatCreationErrorConstants.errorMessages[maybeError!]!,
                mainView: self)
        } else {
            
            self.openSafari()
        }
    }
    
    /**
     Hat address is valid and can be used with HAT, go to next screen
     
     - parameter result: It contains `hatName` and `hatCluster` for that hat
     */
    private func openSafari() {
        
        let redirectUri = "\(Auth.urlScheme)://registration"
        let hatters: String = "https://hatters.hubofallthings.com/services/baas/signup"

        self.openInSafari(url: "\(hatters)?email=\(self.purchaseModel.email)&hat_name=\(self.hatAddressTextField.text!)&application_id=\(AppStatusManager.getAppName())&redirect_uri=\(redirectUri)&newsletter_optin=\(!self.purchaseModel.options.isEmpty)", animated: true, completion: nil)
    }
    
    // MARK: - Text Field Did change
    
    /**
     Used in order to update the button state on each letter entry by the user
     */
    @objc
    private func textFieldDidChange() {

        BannerView.hideBanner(self.bannerView, label: self.bannerMessageLabel, bannerConstraint: self.bannerHeightConstraint, mainView: self.view)
        self.updateButtonState(textFieldCharactersCount: (self.hatAddressTextField.text?.count ?? 0))
    }
    
    /// Enables the use of the `Return` key in the keyboard. It executes the `nextButtonAction` IBAction
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.nextButtonAction(self)
        return true
    }
    
    // MARK: - Update button state
    
    /**
     Updates the button color and if it's selectable or not, depenting from the password score
     
     - parameter textFieldCharactersCount: The characters count of the `UITextField`
     - parameter enabled: If `UITextField` is enabled
     */
    private func updateButtonState(textFieldCharactersCount: Int, enabled: Bool? = nil) {
        
        let result = self.hatAddressTextField.text != "" && textFieldCharactersCount > 3 && textFieldCharactersCount < 23
        if enabled ?? result {
            
            self.nextButton.backgroundColor = .selectionColor
            self.nextButton.isUserInteractionEnabled = true
        } else {
            
            self.nextButton.backgroundColor = .hatDisabled
            self.nextButton.isUserInteractionEnabled = false
        }
    }
    
    // MARK: - Authorisation functions
    
    /**
     Takes the notification that the user can be logged in in order to start the authentication process
     
     - parameter notification: The notification received from the login precedure.
     */
    private func hatLoginAuth(notification: Notification) {
        
        // get the url form the auth callback
        guard let url: URL = notification.object as? URL else { return }
        
        /**
         User has been logged in successfully. Close any pop ups, update the variables in the keychain and continue to the main app
         
         - parameter userDomain: User's userdomain as received from the back end
         - parameter token: The token received from the back end
         */
        func success(userDomain: String?, token: String?) {
            
            KeychainManager.setKeychainValue(key: KeychainConstants.userToken, value: token)
            KeychainManager.setKeychainValue(key: KeychainConstants.hatDomainKey, value: userDomain)
            KeychainManager.setKeychainValue(key: KeychainConstants.logedIn, value: KeychainConstants.Values.setTrue)

            self.coordinator?.stop()
                        
            self.dismissSafari(animated: true, completion: nil)
        }
        
        /**
         Log in failed. There was an error. Inform user of the fact
         
         - parameter error: The error received by the back end
         */
        func failed(error: AuthenicationError) {
            
            self.dismissSafari(animated: true, completion: nil)
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
     Checks if the request made for a new HAT was a success or not. Displays a custom alert in both cases
     
     - parameter notif: The notification received. This was triggered by a redirect from HAT in order to respond to a new hat registration
     */
    @objc
    private func hatRegistrationCallback(notif: Notification) {
        
        self.dismissSafari(animated: true, completion: nil)
        guard let url: URL = notif.object as? URL, let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        
        let maybeToken = components.queryItems?.first(where: {item in
            
            item.name == "token"
        })
        
        if maybeToken != nil {
            
            CustomAlertImageViewController.present(
                presentingView: self,
                status: .success,
                buttonTitle: "LOG ME IN",
                mainDescription: "\(self.hatAddressTextField.text!)\(self.selectedCluster.text!)",
                secondaryDescription: "Your HAT PDA with the following URL has been created:",
                title: "Success!",
                buttonAction: { [weak self] in
                
                   self?.hatLoginAuth(notification: notif)
                },
                completion: { [weak self] alert in
                    
                    self?.customImageAlert = alert
                })
        } else {
            
            CustomAlertImageViewController.present(
                presentingView: self,
                status: .failure,
                buttonTitle: "OK",
                mainDescription: nil,
                secondaryDescription: "We ran into some technical trouble when creating your HAT PDA. Your information has not been taken. Please try again later!",
                title: "Oh no!",
                buttonAction: nil,
                completion: { [weak self] alert in
                    
                    self?.customImageAlert = alert
            })
        }
    }
}
