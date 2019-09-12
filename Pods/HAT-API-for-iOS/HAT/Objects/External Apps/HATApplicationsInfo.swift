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

public struct HATApplicationsInfo: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `version` in JSON is `version`
     * `isPublished` in JSON is `published`
     * `name` in JSON is `name`
     * `termsUrl` in JSON is `termsUrl`
     * `supportContact` in JSON is `supportContact`
     * `headline` in JSON is `headline`
     * `rating` in JSON is `rating`
     * `description` in JSON is `description`
     * `dataPreview` in JSON is `dataPreview`
     * `graphics` in JSON is `graphics`
     * `primaryColor` in JSON is `primaryColor`
     */
    private enum CodingKeys: String, CodingKey {
        
        case version = "version"
        case isPublished = "published"
        case name = "name"
        case termsUrl = "termsUrl"
        case supportContact = "supportContact"
        case headline = "headline"
        case rating = "rating"
        case description = "description"
        case dataPreview = "dataPreview"
        case graphics = "graphics"
        case primaryColor = "primaryColor"
    }
    
    // MARK: - Variables
    
    /// The current HAT version of the app
    public var version: String = ""
    
    /// A flag indicating if the app has been published or not
    public var isPublished: Bool = false
    
    /// The name of the app
    public var name: String = ""
    
    /// The terms and conditions URL, users must be able to read them
    public var termsUrl: String = ""
    
    /// The support email address. Needed in case a user has a problem with your app
    public var supportContact: String = ""
    
    /// The headline text to describe the app. Short text usually a phrase or two.
    public var headline: String = ""
    
    /// The rating of the app. You can learn more about rating [here.](https://www.hatcommunity.org/hat-dex-rating) Optional
    public var rating: HATApplicationsRating?
    
    /// The description text of the app. A more detailed description of your app, in pure text, markdown(optional) and html(optional)
    public var description: HATApplicationsDescription = HATApplicationsDescription()
    
    /// The data preview of the app. Apps can post data on the `SHE` feed. This is a preview of that data in order to show it in the UI of the detailed view of the app.
    public var dataPreview: [HATFeed] = []
    
    /// The graphics, images, needed for this app (logo, banner and screenshots)
    public var graphics: HATApplicationsGraphics = HATApplicationsGraphics()
    
    /// Some apps/data plugs have a background color attached to them. This usually matched the main color from their logo
    public var primaryColor: String?
}
