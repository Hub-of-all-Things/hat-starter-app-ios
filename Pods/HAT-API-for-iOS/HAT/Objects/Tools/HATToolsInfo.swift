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

public struct HATToolsInfo: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `version` in JSON is `version`
     * `versionReleaseDate` in JSON is `versionReleaseDate`
     * `name` in JSON is `name`
     * `headline` in JSON is `headline`
     * `description` in JSON is `description`
     * `termsURL` in JSON is `termsURL`
     * `supportContact` in JSON is `supportContact`
     * `dataPreview` in JSON is `dataPreview`
     * `graphics` in JSON is `graphics`
     * `dataPreviewEndpoint` in JSON is `dataPreviewEndpoint`
     */
    private enum CodingKeys: String, CodingKey {
        
        case version = "version"
        case versionReleaseDate = "versionReleaseDate"
        case name = "name"
        case headline = "headline"
        case description = "description"
        case termsURL = "termsUrl"
        case supportContact = "supportContact"
        case dataPreview = "dataPreview"
        case graphics = "graphics"
        case dataPreviewEndpoint = "dataPreviewEndpoint"
    }
    
    // MARK: - Variables

    /// The current version of the tool
    public var version: String = ""
    /// The last version's release date
    public var versionReleaseDate: String = ""
    /// The name of the toole
    public var name: String = ""
    /// The headline of the tool. A few words of what the tool is
    public var headline: String = ""
    /// A description of what the tool is and what it does
    public var description: HATApplicationsDescription = HATApplicationsDescription()
    /// The URL for the terms and conditions. User has to be able to see and read the terms and conditions
    public var termsURL: String = ""
    /// An email address in order for the user to be able to contact the developer of the tool
    public var supportContact: String = ""
    /// An array of `HATFeed` items used for data previews. Optional
    public var dataPreview: [HATFeed]?
    /// URLs for logo and screeshots of the tool. Used to showcase the tool
    public var graphics: HATToolsGraphics = HATToolsGraphics()
    /// The endpoind in the HAT to fetch the datapreviews.
    public var dataPreviewEndpoint: String = ""
}
