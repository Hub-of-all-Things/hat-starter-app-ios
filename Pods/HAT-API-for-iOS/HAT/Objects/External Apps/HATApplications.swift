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

public struct HATApplications: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `applicationID` in JSON is `id`
     * `kind` in JSON is `kind`
     * `info` in JSON is `info`
     * `developer` in JSON is `developer`
     * `permissions` in JSON is `permissions`
     * `setup` in JSON is `setup`
     * `status` in JSON is `status`
     */
    private enum CodingKeys: String, CodingKey {
        
        case applicationID = "id"
        case kind = "kind"
        case info = "info"
        case developer = "developer"
        case permissions = "permissions"
        case setup = "setup"
        case status = "status"
    }
    
    // MARK: - Variables
    
    /// The id of the specified application
    public var applicationID: String = ""
    /// The kind, Internal or External, and the urls, App Store URL and iOSUrl, of the app
    public var kind: HATApplicationsKind = HATApplicationsKind()
    /// Various information about the app, isReleased, version, name etc.
    public var info: HATApplicationsInfo = HATApplicationsInfo()
    /// Information about the developer, Name, contact info etc.
    public var developer: HATApplicationsDeveloper = HATApplicationsDeveloper()
    /// App's permissions to read or write to HAT
    public var permissions: HATApplicationsPermissions = HATApplicationsPermissions()
    /// Details about the setup of the app, such as the iosURL needed
    public var setup: HATApplicationsSetup = HATApplicationsSetup()
    /// The status of the app on HAT
    public var status: HATApplicationsStatus = HATApplicationsStatus()
}
