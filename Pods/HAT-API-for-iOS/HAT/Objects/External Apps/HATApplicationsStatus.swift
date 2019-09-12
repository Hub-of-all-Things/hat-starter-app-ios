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

public struct HATApplicationsStatus: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `lastCompatibleVersion` in JSON is `compatibility`
     * `recentDataCheckEndpoint` in JSON is `recentDataCheckEndpoint`
     * `kind` in JSON is `kind`
     * `statusUrl` in JSON is `statusUrl`
     * `versionReleaseDate` in JSON is `versionReleaseDate`
     * `expectedStatus` in JSON is `expectedStatus`
     * `dataPreviewEndpoint` in JSON is `dataPreviewEndpoint`
     * `staticDataPreviewEndpoint` in JSON is `staticDataPreviewEndpoint`
     */
    private enum CodingKeys: String, CodingKey {
        
        case lastCompatibleVersion = "compatibility"
        case recentDataCheckEndpoint = "recentDataCheckEndpoint"
        case kind = "kind"
        case statusUrl = "statusUrl"
        case versionReleaseDate = "versionReleaseDate"
        case expectedStatus = "expectedStatus"
        case dataPreviewEndpoint = "dataPreviewEndpoint"
        case staticDataPreviewEndpoint = "staticDataPreviewEndpoint"
    }
    
    // MARK: - Variables
    
    /// The compatibility of this app
    public var lastCompatibleVersion: String = ""
    /// The endpoing this app will be reading or writing on HAT, eg facebook/feed. Optional
    public var recentDataCheckEndpoint: String?
    /// The kind of the app. External or Internal
    public var kind: String = ""
    /// A URL that you can make a request to check the status of the app if neccesary. Optional
    public var statusUrl: String?
    /// The date the last version was released
    public var versionReleaseDate: String = ""
    /// The expected status that the application will return. Usually 200. Optional
    public var expectedStatus: Int?
    /// A URL that has some preview data, usually in the form of a feed item, for this application. Optional
    public var dataPreviewEndpoint: String?
    /// A URL that is used to fetch the static data for this application. Optional
    public var staticDataPreviewEndpoint: String?
}
