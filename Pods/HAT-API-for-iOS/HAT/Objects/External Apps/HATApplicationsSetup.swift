//
/**
 * Copyright (C) 2018 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

// MARK: Struct

public struct HATApplicationsSetup: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `iosUrl` in JSON is `iosUrl`
     * `applicationUrl` in JSON is `url`
     * `kind` in JSON is `kind`
     * `preferences` in JSON is `preferences`
     * `onboarding` in JSON is `onboarding`
     */
    private enum CodingKeys: String, CodingKey {
        
        case iosUrl = "iosUrl"
        case applicationUrl = "url"
        case kind = "kind"
        case preferences = "preferences"
        case onboarding = "onboarding"
   }

    // MARK: - Variables
    
    /// The url needed to launch the app from another app using the URL Scheme. Like appname://something. Optional
    public var iosUrl: String?
    /// The url needed to open in safari, in case of an iOS app this will be the App Store url. Optional
    public var applicationUrl: String?
    /// The kind of app this is. External or Internal
    public var kind: String = ""
    /// Preferences for the app. Optional
    public var preferences: String?
    /// The onboarding screens to show for the particular application. Optional
    public var onboarding: [HATApplicationsOnboarding]?
}
