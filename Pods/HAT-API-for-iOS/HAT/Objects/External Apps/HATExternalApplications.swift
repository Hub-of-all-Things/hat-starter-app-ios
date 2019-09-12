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

public struct HATExternalApplications: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `application` in JSON is `application`
     * `isSetup` in JSON is `setup`
     * `isActive` in JSON is `active`
     * `isEnabled` in JSON is `enabled`
     * `needsUpdating` in JSON is `needsUpdating`
     * `lastTimeDataUpdated` in JSON is `mostRecentData`
     */
    private enum CodingKeys: String, CodingKey {
        
        case application = "application"
        case isSetup = "setup"
        case isActive = "active"
        case isEnabled = "enabled"
        case needsUpdating = "needsUpdating"
        case lastTimeDataUpdated = "mostRecentData"
    }
    
    // MARK: - Variables
    
    /// The application Information
    public var application: HATApplications = HATApplications()
    /// A flag indicating if the application is setup. This can only change by the HAT and not manually
    public var isSetup: Bool = false
    /// A flag indicating if the applciation is active. It can be deactivated manually or by HAT
    public var isActive: Bool = false
    /// A flag indicating if the application is enabled. It can be disabled manually or by HAT
    public var isEnabled: Bool = false
    /// A flag indicating if the application needs updating. Every time a new version is being introduced in the HAT, this might indicate that the user need to setup the application again. One possible reason for this is the terms and conditions changed. Optional
    public var needsUpdating: Bool?
    /// A date in an ISO format indicating the last time the application wrote data in the HAT. Optional
    public var lastTimeDataUpdated: String?
}
