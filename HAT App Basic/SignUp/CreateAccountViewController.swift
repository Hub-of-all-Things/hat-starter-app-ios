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

internal class CreateAccountViewController: HATCreationUIViewController, SafariDelegateProtocol, SFSafariViewControllerDelegate {
    
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
    
    // MARK: - IBOutlet

    /// An IBOutlet to controll the email textField
    @IBOutlet private weak var emailTextField: UITextField!
    /// An IBOutlet to controll the next button
    @IBOutlet private weak var nextButton: UIButton!
    /// An IBOutlet to controll the checkmark image
    @IBOutlet private weak var checkmarkImageView: UIImageView!
    /// An IBOutlet to controll the privacy UILabel
    @IBOutlet private weak var privacyLabel: UILabel!
    /// An IBOutlet to controll the banner error message UILabel
    @IBOutlet private weak var bannerErrorLabel: UILabel!
    /// An IBOutlet for holding a reference to the error banner UIView
    @IBOutlet private weak var bannerView: UIView!
    /// An IBOutlet for holding a reference to the error banner height contraint
    @IBOutlet private weak var bannerViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    
    /// A flag indicating if the checkbox is enabled
    private var isCheckboxEnabled: Bool = false
    /// The mailing list options user chose
    private var mailingListOptIns: [String] = []
    
    // MARK: - IBActions
    
    /**
     Called when next button is pressed. Check the fields for error and checks with hat the email field. If ok continues to the next screen
     
     - parameter sender: The object that called the function
     */
    @IBAction func nextButtonAction(_ sender: Any) {
        
        self.checkFields()
        self.updateButtonState(enabled: false)
    }
    
    // MARK: - View controller delegate functions
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.setUpUI()
    }

    // MARK: - Set up view
    
    /**
     Sets up the UI view elements
     */
    private func setUpUI() {
        
        // UI changes to the emailTextField
        self.emailTextField.setLeftPaddingPoints(20)
        self.emailTextField.layer.borderWidth = 1
        self.emailTextField.layer.borderColor = UIColor.hatDisabled.cgColor
        self.emailTextField.delegate = self
        self.emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        // UI changes to the nextButton
        self.nextButton.layer.cornerRadius = 5
        
        // set solid color navigation bar
        self.addGestureRecognizersToCheckboxes()
        self.formatPrivacyLabel()
        self.updateButtonState()
    }
    
    // MARK: - Check fields
    
    /**
     Checks the fields if ok, before sending a request to the hat. If something wrong it shows messages
     */
    private func checkFields() {
        
        let email: String = self.emailTextField.text!.trimString()
        if email.isValidEmail() {
            
            self.checkEmail()
        } else {
            
            BannerView.showBanner(
                self.bannerView,
                label: self.bannerErrorLabel,
                bannerConstraint: self.bannerViewHeightConstraint,
                text: "Email is not valid. Please check the email field again",
                mainView: self)
        }
    }
    
    // MARK: - Update state of button
    
    /**
     Updates the button color and if it's selectable or not, depenting in the values of the textFields
     
     - parameter enabled: A flag to force enable the button
     */
    private func updateButtonState(enabled: Bool? = nil) {
        
        if enabled ?? (self.emailTextField.text ?? "").isValidEmail() {
            
            self.nextButton.isUserInteractionEnabled = true
            self.nextButton.backgroundColor = .selectionColor
        } else {
            
            self.nextButton.isUserInteractionEnabled = false
            self.nextButton.backgroundColor = .hatDisabled
        }
    }
    
    // MARK: - Check email with HAT
    
    /**
     Checks the email address with HAT
     */
    private func checkEmail() {
        
        let email: String = self.emailTextField.text!.trimString()
        self.emailTextField.text = email
        
        self.buildModel()
    }
    
    /**
     Something went wrong while checking the email address with HAT. Show error message
     
     - parameter result: It contains a message that the email is available
     */
    private func buildModel() {
        
        purchaseModel.email = self.emailTextField.text!.trimString()
        purchaseModel.firstName = ""
        purchaseModel.lastName = ""
        purchaseModel.hatCluster = cluster
        purchaseModel.hatCountry = "United Kingdom"
        purchaseModel.membership.membershipType = "trial"
        purchaseModel.membership.plan = "sandbox"
        purchaseModel.applicationID = Auth.serviceName
        
        self.coordinator?.goToNextScreen(fromViewController: self)
    }
    
    /**
     Adds a tap gesture recognisers to the checkmark `UIImageView` and privacy `UILabel`
     */
    private func addGestureRecognizersToCheckboxes() {
        
        let checkBoxGesture = UITapGestureRecognizer(target: self, action: #selector(checkBoxTapped))
        self.checkmarkImageView.addGestureRecognizer(checkBoxGesture)
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(privacyLabelTapped(tapGestureRecogniser:)))
        tapGesture.numberOfTapsRequired = 1
        self.privacyLabel.isUserInteractionEnabled = true
        self.privacyLabel.addGestureRecognizer(tapGesture)
    }
    
    /**
     Formats the privacy label text.
     */
    private func formatPrivacyLabel() {
        
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.selectionColor]
        let attributedString = NSMutableAttributedString(string: "You can change your mind at any time by clicking the unsubscribe link in the footer of any email you receive from us. Learn how we treat your information with respect in our privacy policy. By clicking ‘Next’ you agree to have read the privacy policy.\n")
        attributedString.addAttributes(attributes, range: NSRange(location: 174, length: 14))
        self.privacyLabel.attributedText = attributedString
    }
    
    /**
     Changes the image of the `UIImageView` and toggles the `isCheckboxEnabled` flag
     */
    @objc
    private func checkBoxTapped() {
    
        if self.isCheckboxEnabled {
            
            self.mailingListOptIns.removeAll()
            self.checkmarkImageView.image = UIImage(named: "Checkbox empty")
        } else {
            
            self.mailingListOptIns = ["mailingListOptIns"]
            self.checkmarkImageView.image = UIImage(named: "Checkbox checkmark")
        }
        self.purchaseModel.options = self.mailingListOptIns
        self.isCheckboxEnabled.toggle()
    }
    
    /**
     Detects if the user tapped the label in the range we want
     
     - parameter tapGestureRecogniser: The UITapGestureRecognizer that called this method
     */
    @objc
    private func privacyLabelTapped(tapGestureRecogniser: UITapGestureRecognizer) {
        
        self.openInSafari(url: LegalsUrl.privacyPolicy, animated: true, completion: nil)
    }
    
    // MARK: - Text field Delegate methods
    
    /**
     Using this to update the button state when user types something
     */
    @objc
    func textFieldDidChange() {
        
        BannerView.hideBanner(
            self.bannerView,
            label: self.bannerErrorLabel,
            bannerConstraint: self.bannerViewHeightConstraint,
            mainView: self.view)
        self.updateButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.nextButtonAction(self)
        return true
    }
}
