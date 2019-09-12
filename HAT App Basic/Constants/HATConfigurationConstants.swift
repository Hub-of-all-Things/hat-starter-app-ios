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

import Foundation

// MARK: Auth Struct

/// Struct used to store values needed for the authorisation
internal struct Auth {
    
    // MARK: - Variables
    
    /// app's url scheme
    static let urlScheme: String = "testhatapp"
    /// The hat service name
    static let serviceName: String = AppStatusManager.getAppName()
    /// The host used in the redirect url after the log in has finished succesfully
    static let localAuthHost: String = "testhatapphost"
    /// A notification send from the AppDelegate after successfully loged user in
    static let notificationHandlerName: String = "testhatappnotificationhandler"
    /// A string used to identify if that url is comming from hat registration.
    static let registration: String = "registration"

    // MARK: - Constuct hat login URL
    
    /**
     Constructs a url in order to log in to the hat specified in the parameters
     
     - parameter userDomain: User's domain
     
     - returns: A string with the login url to connect to
     */
    static func hatLoginURL(userDomain: String) -> String {
        
        return "https://\(userDomain)/#/hatlogin?name=\(Auth.serviceName)&redirect=\(Auth.urlScheme)://\(Auth.localAuthHost)&fallback=\(Auth.urlScheme)://loginfailed"
    }
}

// MARK: - AppName Struct

/// A struct used to hold app specific variables
internal struct AppName {
    
    // MARK: - Variables
    
    /// The name of the app in the url schema
    static let name: String = "testhatapp"
}

// MARK: - Domains Struct

/// A struct used to hold the HAT domains specific variables and functions
internal struct Domains {
    
    // MARK: - Get available log in domains
    
    /**
     Returns all the available clusters for the app to connect to
     
     - returns: The available clusters allowed to connect to
     */
    static func getAvailableDomains() -> [String] {
        
        return [".hubat.net"]
    }
}

// MARK: - TermsURL Struct

/// A struct holding the terms URL
internal struct LegalsUrl {
    
    // MARK: - Variables
    
    static let termsAndConditions: String = "https://cdn.dataswift.io/legal/hat-owner-terms-of-service.pdf"
    static let privacyPolicy: String = "https://cdn.dataswift.io/legal/dataswift-privacy-policy.pdf"
}

internal struct CheckDatabaseUrls {
    
    static func validateEmail(email: String, isSandbox: Bool) -> String {
        
        let url: String?
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
           url = NSDictionary(contentsOfFile: path)?["dbUrl"] as? String
        } else {
            url = nil
        }
        
        return "\(url!)?email=\(email)&sandbox=\(isSandbox)"
    }
    
    static func validateUrl(domain: String, isSandbox: Bool) -> String {
        
        let url: String?
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
           url = NSDictionary(contentsOfFile: path)?["dbUrl"] as? String
        } else {
            url = nil
        }
        
        return "\(url!)?name=\(domain)&sandbox=\(isSandbox)"
    }
}

