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

import Alamofire
import HAT_API_for_iOS

// MARK: Extension

extension HATAccountService: UserCredentialsProtocol {
    
    // MARK: - User's settings
    
    /**
     Get the Market Access Token for the iOS data plug
     
     - returns: UserHATDomainAlias
     */
    static func theUserHATDomain() -> String {
        
        if let hatDomain: String = KeychainManager.getKeychainValue(key: KeychainConstants.hatDomainKey) {
            
            return hatDomain
        }
        
        return ""
    }
    
    /**
     Get the Market Access Token for the iOS data plug
     
     - returns: UserHATDomainAlias
     */
    static func theUserEmail() -> String {
        
        if let email: String = KeychainManager.getKeychainValue(key: KeychainConstants.userEmail) {
            
            return email
        }
        
        return ""
    }
    
    /**
     Gets user's token from keychain
     
     - returns: The token as a string
     */
    static func getUsersTokenFromKeychain() -> String {
        
        // check if the token has been saved in the keychain and return it. Else return an empty string
        if let token: String = KeychainManager.getKeychainValue(key: KeychainConstants.userToken) {
            
            return token
        }
        
        return ""
    }
    
    static func checkIfHatExists(_ hatAddress: String, addressEnteredByUser: String, hatDoesNotExistCompletion: @escaping ((String) -> Void), hatExistsCompletion: @escaping ((String) -> Void)) {
        
        func failed(error: String) {
            
            hatDoesNotExistCompletion("Wrong domain")
        }
        
        func showError(error: HATError) {
            
            hatDoesNotExistCompletion("General error")
        }
        
        func success(publicKey: String) {
            
            let overrideDomainCheck = addressEnteredByUser.contains(".")
            if overrideDomainCheck {
                
                hatExistsCompletion(addressEnteredByUser)
            } else if let config = Bundle.main.object(forInfoDictionaryKey: "Config") as? String {
                
                HATAccountService.verifyHatAddress(
                    config: config,
                    hatAddress: hatAddress,
                    domains: Domains.getAvailableDomains(),
                    domainVerified: hatExistsCompletion,
                    verificationFailed: failed)
            }
        }
        
        guard hatAddress != "" else {
            
            hatDoesNotExistCompletion("Address empty")
            return
        }
        
        HATLoginService.getPublicKey(
            userDomain: hatAddress,
            completion: success,
            failed: showError)
    }
    
    static func verifyHatAddress(config: String, hatAddress: String, domains: [String], domainVerified: @escaping ((String) -> Void), verificationFailed: @escaping ((String) -> Void)) {
        
        if config == "Beta" && !hatAddress.hasSuffix(".hubat.net") {
            
            verificationFailed("This is a testing version of the app")
        } else {
            
            HATLoginService.formatAndVerifyDomain(
                userHATDomain: hatAddress,
                verifiedDomains: Domains.getAvailableDomains(),
                successfulVerification: domainVerified,
                failedVerification: verificationFailed)
        }
    }
}
