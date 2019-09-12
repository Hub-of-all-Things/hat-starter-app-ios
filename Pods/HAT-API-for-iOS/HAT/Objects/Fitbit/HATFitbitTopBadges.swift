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

public struct HATFitbitTopBadges: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `name` in JSON is `name`
     * `value` in JSON is `value`
     * `cheers` in JSON is `cheers`
     * `dateTime` in JSON is `dateTime`
     * `badgeType` in JSON is `badgeType`
     * `encodedID` in JSON is `encodedId`
     * `badgeImage50URL` in JSON is `image50px`
     * `badgeImage75URL` in JSON is `image75px`
     * `shareText` in JSON is `shareText`
     * `shortName` in JSON is `shortName`
     * `badgeImage100URL` in JSON is `image100px`
     * `badgeImage125URL` in JSON is `image125px`
     * `badgeImage300URL` in JSON is `image300px`
     * `description` in JSON is `description`
     * `earnedMessage` in JSON is `earnedMessage`
     * `timesAchieved` in JSON is `timesAchieved`
     * `shareImage640URL` in JSON is `shareImage640px`
     * `shortDescription` in JSON is `shortDescription`
     * `mobileDescription` in JSON is `mobileDescription`
     * `marketingDescription` in JSON is `marketingDescription`
     * `badgeGradientEndColor` in JSON is `badgeGradientEndColor`
     * `badgeGradientStartColor` in JSON is `badgeGradientStartColor`
     */
    private enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case value = "value"
        case cheers = "cheers"
        case dateTime = "dateTime"
        case badgeType = "badgeType"
        case encodedID = "encodedId"
        case badgeImage50URL = "image50px"
        case badgeImage75URL = "image75px"
        case shareText = "shareText"
        case shortName = "shortName"
        case badgeImage100URL = "image100px"
        case badgeImage125URL = "image125px"
        case badgeImage300URL = "image300px"
        case description = "description"
        case earnedMessage = "earnedMessage"
        case timesAchieved = "timesAchieved"
        case shareImage640URL = "shareImage640px"
        case shortDescription = "shortDescription"
        case mobileDescription = "mobileDescription"
        case marketingDescription = "marketingDescription"
        case badgeGradientStartColor = "badgeGradientStartColor"
        case badgeGradientEndColor = "badgeGradientEndColor"
    }

    // MARK: - Variables
    
    /// The badge's name
    public var name: String = ""
    /// The badge's value
    public var value: Int = 0
    /// The badge's cheers
    public var cheers: [String] = []
    /// The badge's category
    public var category: String = ""
    /// The date the badge was earned in an ISO format
    public var dateTime: String = ""
    /// The badge's type
    public var badgeType: String = ""
    /// The badge's encoded ID
    public var encodedID: String = ""
    /// The badge's image URL in 50x50
    public var badgeImage50URL: String = ""
    /// The badge's image URL in 75X75
    public var badgeImage75URL: String = ""
    /// The badge's share text
    public var shareText: String = ""
    /// The badge's short name
    public var shortName: String = ""
    /// The badge's image URL in 100x100
    public var badgeImage100URL: String = ""
    /// The badge's image URL in 125x125
    public var badgeImage125URL: String = ""
    /// The badge's image URL in 300x300
    public var badgeImage300URL: String = ""
    /// The badge's description
    public var description: String = ""
    /// The badge's message when earned
    public var earnedMessage: String = ""
    /// The total times this badge has been earned
    public var timesAchieved: Int = 0
    /// The badge's share image URL in 640x640
    public var shareImage640URL: String = ""
    /// The badge's short description
    public var shortDescription: String = ""
    /// The badge's mobile description
    public var mobileDescription: String = ""
    /// The badge's marketing description
    public var marketingDescription: String = ""
    /// The badge's gradient end color
    public var badgeGradientEndColor: String = ""
    /// The badge's gradient start color
    public var badgeGradientStartColor: String = ""
}
