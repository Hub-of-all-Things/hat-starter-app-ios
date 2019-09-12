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

import SwiftyJSON

// MARK: Struct

/// A class representing the user's info of a tweet
public struct HATTwitterUsers: HatApiType, Comparable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON Fields used by the hat
     
     The fields are the following:
     * `friendsCount` in JSON is `friends_count`
     * `userID` in JSON is `id`
     * `language` in JSON is `lang`
     * `favoritesCount` in JSON is `favorites_count`
     * `statusesCount` in JSON is `statuses_count`
     * `listedCount` in JSON is `listed_count`
     * `screenName` in JSON is `screen_name`
     * `name` in JSON is `name`
     * `url` in JSON is `url`
     * `followersCount` in JSON is `followers_count`
     * `location` in JSON is `location`
     * `isVerified` in JSON is `verified`
     * `isFollowing` in JSON is `following`
     * `isProtected` in JSON is `protected`
     * `timeZone` in JSON is `time_zone`
     * `createdAt` in JSON is `created_at`
     * `utcOffset` in JSON is `utc_offset`
     * `description` in JSON is `description`
     * `isGeoEnabled` in JSON is `geo_enabled`
     * `isTranslator` in JSON is `is_translator`
     * `hasNotifications` in JSON is `notifications`
     * `isDefaultProfile` in JSON is `default_profile`
     * `translatorType` in JSON is `translator_type`
     * `profileImageUrl` in JSON is `profile_image_url`
     * `profileLinkColor` in JSON is `profile_link_color`
     * `profileTextColor` in JSON is `profile_text_color`
     * `timeZone` in JSON is `follow_request_sent`
     * `hasContributorsEnabled` in JSON is `contributors_enabled`
     * `hasExtendedProfile` in JSON is `has_extended_profile`
     * `hasDefaultProfileImage` in JSON is `default_profile_image`
     * `isTranslationEnabled` in JSON is `is_translation_enabled`
     * `hasProfileBackgroundTile` in JSON is `profile_background_tile`
     * `profileImageUrlHttps` in JSON is `profile_image_url_https`
     * `profileBackgroundColor` in JSON is `profile_background_color`
     * `profileSidebarFillColor` in JSON is `profile_sidebar_fill_color`
     * `profileBackgroundImageUrl` in JSON is `profile_background_image_url`
     * `profileSidebarBorderColor` in JSON is `profile_sidebar_border_color`
     * `isProfileUsingBackgroundImage` in JSON is `profile_use_background_image`
     * `profileBackgroundImageUrlHttps` in JSON is `profile_background_image_url_https`
     */
    private enum CodingKeys: String, CodingKey {
        
        case friendsCount = "friends_count"
        case userID = "id"
        case language = "lang"
        case favoritesCount = "favorites_count"
        case statusesCount = "statuses_count"
        case listedCount = "listed_count"
        case screenName = "screen_name"
        case name = "name"
        case url = "url"
        case followersCount = "followers_count"
        case location = "location"
        case isVerified = "verified"
        case isFollowing = "following"
        case isProtected = "protected"
        case timeZone = "time_zone"
        case createdAt = "created_at"
        case utcOffset = "utc_offset"
        case description = "description"
        case isGeoEnabled = "geo_enabled"
        case isTranslator = "is_translator"
        case hasNotifications = "notifications"
        case isDefaultProfile = "default_profile"
        case translatorType = "translator_type"
        case profileImageUrl = "profile_image_url"
        case profileLinkColor = "profile_link_color"
        case profileTextColor = "profile_text_color"
        case isFollowRequestSent = "follow_request_sent"
        case hasContributorsEnabled = "contributors_enabled"
        case hasExtendedProfile = "has_extended_profile"
        case hasDefaultProfileImage = "default_profile_image"
        case isTranslationEnabled = "is_translation_enabled"
        case hasProfileBackgroundTile = "profile_background_tile"
        case profileImageUrlHttps = "profile_image_url_https"
        case profileBackgroundColor = "profile_background_color"
        case profileSidebarFillColor = "profile_sidebar_fill_color"
        case profileBackgroundImageUrl = "profile_background_image_url"
        case profileSidebarBorderColor = "profile_sidebar_border_color"
        case isProfileUsingBackgroundImage = "profile_use_background_image"
        case profileBackgroundImageUrlHttps = "profile_background_image_url_https"
    }
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATTwitterUsers, rhs: HATTwitterUsers) -> Bool {
        
        return (lhs.friendsCount == rhs.friendsCount && lhs.userID == rhs.userID && lhs.lang == rhs.lang && lhs.listedCount == rhs.listedCount && lhs.favouritesCount == rhs.favouritesCount && lhs.statusesCount == rhs.statusesCount && lhs.screenName == rhs.screenName && lhs.name == rhs.name && lhs.followersCount == rhs.followersCount)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: HATTwitterUsers, rhs: HATTwitterUsers) -> Bool {
        
        return lhs.name < rhs.name
    }
    
    // MARK: - Variables
    
    /// The user's friend count
    public var friendsCount: Int = 0
    /// The user's id
    public var userID: Int = 0
    /// The user's language
    public var lang: String = ""
    /// The user's listed count
    public var listedCount: Int = 0
    /// The user's favourites count
    public var favouritesCount: Int = 0
    /// The user's statuses count
    public var statusesCount: Int = 0
    /// The user's screen name
    public var screenName: String = ""
    /// The user's name
    public var name: String = ""
    /// The user's followers count
    public var followersCount: String = ""
    /// The user's profile URL
    public var url: String = ""
    // The user's location
    public var location: String = ""
    /// A flag indicating if the user has been verified by twitter
    public var isVerified: Bool = false
    /// A flag indicating if the user is following accounts
    public var isFollowing: Bool = false
    /// A flag indicatinf if the user is protected by twitter
    public var isProtected: Bool = false
    /// User's time zone. Optional
    public var timeZone: String?
    /// The date the profile has been created in ISO format
    public var createdAt: String = ""
    /// The utc offset. Optional
    public var utcOffset: String?
    /// A description added by the user under the profile
    public var description: String = ""
    /// A flag indicating if the location tracking is enabled
    public var isGeoEnabled: Bool = false
    /// A flag indicating if user is a translator
    public var isTranslator: Bool = false
    /// A flag indicating if user has enabled notifications
    public var hasNotifications: Bool = false
    /// A floag indicating if this is the default profile
    public var isDefaultProfile: Bool = false
    /// The type of the translator
    public var translatorType: String = ""
    /// User's profile image URL
    public var profileImageUrl: String = ""
    /// User's link color
    public var profileLinkColor: String = ""
    /// User's profile text color
    public var profileTextColor: String = ""
    /// A flag indicating if the follow request has been sent
    public var isFollowRequestSent: Bool = false
    /// A flag indicating if user has contributors enabled
    public var hasContributorsEnabled: Bool = false
    /// A flag indicating if user has extended profile
    public var hasExtendedProfile: Bool = false
    /// A flag indicating if the profile image is the default
    public var hasDefaultProfileImage: Bool = false
    /// A flag indicating if the translation is enabled
    public var isTranslationEnabled: Bool = false
    /// A flag indicatinf if user has a profile background tile
    public var hasProfileBackgroundTile: Bool = false
    /// User's profile image URL
    public var profileImageUrlHttps: String = ""
    /// User's profile background color
    public var profileBackgroundColor: String = ""
    /// User's profile sidebar color
    public var profileSidebarFillColor: String = ""
    /// User's profile background image URL
    public var profileBackgroundImageUrl: String = ""
    /// User's sidebar border color
    public var profileSidebarBorderColor: String = ""
    /// A flag indicating if the user uses background image
    public var isProfileUsingBackgroundImage: Bool = false
    /// The url for the background image
    public var profileBackgroundImageUrlHttps: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        friendsCount = 0
        userID = 0
        lang = ""
        listedCount = 0
        favouritesCount = 0
        statusesCount = 0
        screenName = ""
        name = ""
        followersCount = ""
        url = ""
        location = ""
        isVerified = false
        isFollowing = false
        isProtected = false
        timeZone = nil
        createdAt = ""
        utcOffset = nil
        description = ""
        isGeoEnabled = false
        isTranslator = false
        hasNotifications = false
        isDefaultProfile = false
        translatorType = ""
        profileImageUrl = ""
        profileLinkColor = ""
        profileTextColor = ""
        isFollowRequestSent = false
        hasContributorsEnabled = false
        hasExtendedProfile = false
        hasDefaultProfileImage = false
        isTranslationEnabled = false
        hasProfileBackgroundTile = false
        profileImageUrlHttps = ""
        profileBackgroundColor = ""
        profileSidebarFillColor = ""
        profileBackgroundImageUrl = ""
        profileSidebarBorderColor = ""
        isProfileUsingBackgroundImage = false
        profileBackgroundImageUrlHttps = ""
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received from the HAT
     */
    public init(from dictionary: Dictionary<String, JSON>) {
        
        self.init()
        
        if let tempFriendsCount: Int = dictionary[CodingKeys.friendsCount.rawValue]?.intValue {
            
            friendsCount = tempFriendsCount
        }
        if let tempID: Int = dictionary[CodingKeys.userID.rawValue]?.intValue {
            
            userID = tempID
        }
        if let tempLang: String = dictionary[CodingKeys.language.rawValue]?.stringValue {
            
            lang = tempLang
        }
        if let tempListedCount: Int = dictionary[CodingKeys.listedCount.rawValue]?.intValue {
            
            listedCount = tempListedCount
        }
        if let tempFavouritesCount: Int = dictionary[CodingKeys.favoritesCount.rawValue]?.intValue {
            
            favouritesCount = tempFavouritesCount
        }
        if let tempStatusesCount: Int = dictionary[CodingKeys.statusesCount.rawValue]?.intValue {
            
            statusesCount = tempStatusesCount
        }
        if let tempScreenName: String = dictionary[CodingKeys.screenName.rawValue]?.stringValue {
            
            screenName = tempScreenName
        }
        if let tempName: String = dictionary[CodingKeys.name.rawValue]?.stringValue {
            
            name = tempName
        }
        if let tempFollowersCount: String = dictionary[CodingKeys.followersCount.rawValue]?.stringValue {
            
            followersCount = tempFollowersCount
        }
        if let tempURL: String = dictionary[CodingKeys.url.rawValue]?.stringValue {
            
            url = tempURL
        }
        if let tempLocation: String = dictionary[CodingKeys.location.rawValue]?.stringValue {
            
            location = tempLocation
        }
        if let tempVerified: Bool = dictionary[CodingKeys.isVerified.rawValue]?.boolValue {
            
            isVerified = tempVerified
        }
        if let tempFollowing: Bool = dictionary[CodingKeys.isFollowing.rawValue]?.boolValue {
            
            isFollowing = tempFollowing
        }
        if let tempProtected: Bool = dictionary[CodingKeys.isProtected.rawValue]?.boolValue {
            
            isProtected = tempProtected
        }
        if let tempTimeZone: String = dictionary[CodingKeys.timeZone.rawValue]?.stringValue {
            
            timeZone = tempTimeZone
        }
        if let tempCreatedAt: String = dictionary[CodingKeys.createdAt.rawValue]?.stringValue {
            
            createdAt = tempCreatedAt
        }
        if let tempUtcOffset: String = dictionary[CodingKeys.utcOffset.rawValue]?.stringValue {
            
            utcOffset = tempUtcOffset
        }
        if let tempDescription: String = dictionary[CodingKeys.description.rawValue]?.stringValue {
            
            description = tempDescription
        }
        if let tempGeoEnabled: Bool = dictionary[CodingKeys.isGeoEnabled.rawValue]?.boolValue {
            
            isGeoEnabled = tempGeoEnabled
        }
        if let tempIsTranslator: Bool = dictionary[CodingKeys.isTranslator.rawValue]?.boolValue {
            
            isTranslator = tempIsTranslator
        }
        if let tempNotifications: Bool = dictionary[CodingKeys.hasNotifications.rawValue]?.boolValue {
            
            hasNotifications = tempNotifications
        }
        if let tempDefaultProfile: Bool = dictionary[CodingKeys.isDefaultProfile.rawValue]?.boolValue {
            
            isDefaultProfile = tempDefaultProfile
        }
        if let tempTranslatorType: String = dictionary[CodingKeys.translatorType.rawValue]?.stringValue {
            
            translatorType = tempTranslatorType
        }
        if let tempProfileImageUrl: String = dictionary[CodingKeys.profileImageUrl.rawValue]?.stringValue {
            
            profileImageUrl = tempProfileImageUrl
        }
        if let tempProfileLinkColor: String = dictionary[CodingKeys.profileLinkColor.rawValue]?.stringValue {
            
            profileLinkColor = tempProfileLinkColor
        }
        if let tempProfileTextColor: String = dictionary[CodingKeys.profileTextColor.rawValue]?.stringValue {
            
            profileTextColor = tempProfileTextColor
        }
        if let tempFollowRequestSent: Bool = dictionary[CodingKeys.isFollowRequestSent.rawValue]?.boolValue {
            
            isFollowRequestSent = tempFollowRequestSent
        }
        if let tempContributorsEnabled: Bool = dictionary[CodingKeys.hasContributorsEnabled.rawValue]?.boolValue {
            
            hasContributorsEnabled = tempContributorsEnabled
        }
        if let tempHasExtendedProfile: Bool = dictionary[CodingKeys.hasExtendedProfile.rawValue]?.boolValue {
            
            hasExtendedProfile = tempHasExtendedProfile
        }
        if let tempDefaultProfileImage: Bool = dictionary[CodingKeys.hasDefaultProfileImage.rawValue]?.boolValue {
            
            hasDefaultProfileImage = tempDefaultProfileImage
        }
        if let tempIsTranslationEnabled: Bool = dictionary[CodingKeys.isTranslationEnabled.rawValue]?.boolValue {
            
            isTranslationEnabled = tempIsTranslationEnabled
        }
        if let tempProfileBackgroundTile: Bool = dictionary[CodingKeys.hasProfileBackgroundTile.rawValue]?.boolValue {
            
            hasProfileBackgroundTile = tempProfileBackgroundTile
        }
        if let tempProfileImageUrlHttps: String = dictionary[CodingKeys.profileImageUrlHttps.rawValue]?.stringValue {
            
            profileImageUrlHttps = tempProfileImageUrlHttps
        }
        if let tempProfileBackgroundColor: String = dictionary[CodingKeys.profileBackgroundColor.rawValue]?.stringValue {
            
            profileBackgroundColor = tempProfileBackgroundColor
        }
        if let temppPofileSidebarFillColor: String = dictionary[CodingKeys.profileSidebarFillColor.rawValue]?.stringValue {
            
            profileSidebarFillColor = temppPofileSidebarFillColor
        }
        if let tempProfileBackgroundImageUrl: String = dictionary[CodingKeys.profileBackgroundImageUrl.rawValue]?.stringValue {
            
            profileBackgroundImageUrl = tempProfileBackgroundImageUrl
        }
        if let tempProfileSidebarBorderColor: String = dictionary[CodingKeys.profileSidebarBorderColor.rawValue]?.stringValue {
            
            profileSidebarBorderColor = tempProfileSidebarBorderColor
        }
        if let temppPofileUseBackgroundImage: Bool = dictionary[CodingKeys.isProfileUsingBackgroundImage.rawValue]?.boolValue {
            
            isProfileUsingBackgroundImage = temppPofileUseBackgroundImage
        }
        if let tempProfileBackgroundImageUrlHttps: String = dictionary[CodingKeys.profileBackgroundImageUrlHttps.rawValue]?.stringValue {
            
            profileBackgroundImageUrlHttps = tempProfileBackgroundImageUrlHttps
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempFriendsCount: Int = dict[CodingKeys.friendsCount.rawValue]?.intValue {
            
            friendsCount = tempFriendsCount
        }
        if let tempID: Int = dict[CodingKeys.userID.rawValue]?.intValue {
            
            userID = tempID
        }
        if let tempLang: String = dict[CodingKeys.language.rawValue]?.stringValue {
            
            lang = tempLang
        }
        if let tempListedCount: Int = dict[CodingKeys.listedCount.rawValue]?.intValue {
            
            listedCount = tempListedCount
        }
        if let tempFavouritesCount: Int = dict[CodingKeys.favoritesCount.rawValue]?.intValue {
            
            favouritesCount = tempFavouritesCount
        }
        if let tempStatusesCount: Int = dict[CodingKeys.statusesCount.rawValue]?.intValue {
            
            statusesCount = tempStatusesCount
        }
        if let tempScreenName: String = dict[CodingKeys.screenName.rawValue]?.stringValue {
            
            screenName = tempScreenName
        }
        if let tempName: String = dict[CodingKeys.name.rawValue]?.stringValue {
            
            name = tempName
        }
        if let tempFollowersCount: String = dict[CodingKeys.followersCount.rawValue]?.stringValue {
            
            followersCount = tempFollowersCount
        }
        if let tempURL: String = dict[CodingKeys.url.rawValue]?.stringValue {
            
            url = tempURL
        }
        if let tempLocation: String = dict[CodingKeys.location.rawValue]?.stringValue {
            
            location = tempLocation
        }
        if let tempVerified: Bool = dict[CodingKeys.isVerified.rawValue]?.boolValue {
            
            isVerified = tempVerified
        }
        if let tempFollowing: Bool = dict[CodingKeys.isFollowing.rawValue]?.boolValue {
            
            isFollowing = tempFollowing
        }
        if let tempProtected: Bool = dict[CodingKeys.isProtected.rawValue]?.boolValue {
            
            isProtected = tempProtected
        }
        if let tempTimeZone: String = dict[CodingKeys.timeZone.rawValue]?.stringValue {
            
            timeZone = tempTimeZone
        }
        if let tempCreatedAt: String = dict[CodingKeys.createdAt.rawValue]?.stringValue {
            
            createdAt = tempCreatedAt
        }
        if let tempUtcOffset: String = dict[CodingKeys.utcOffset.rawValue]?.stringValue {
            
            utcOffset = tempUtcOffset
        }
        if let tempDescription: String = dict[CodingKeys.description.rawValue]?.stringValue {
            
            description = tempDescription
        }
        if let tempGeoEnabled: Bool = dict[CodingKeys.isGeoEnabled.rawValue]?.boolValue {
            
            isGeoEnabled = tempGeoEnabled
        }
        if let tempIsTranslator: Bool = dict[CodingKeys.isTranslator.rawValue]?.boolValue {
            
            isTranslator = tempIsTranslator
        }
        if let tempNotifications: Bool = dict[CodingKeys.hasNotifications.rawValue]?.boolValue {
            
            hasNotifications = tempNotifications
        }
        if let tempDefaultProfile: Bool = dict[CodingKeys.isDefaultProfile.rawValue]?.boolValue {
            
            isDefaultProfile = tempDefaultProfile
        }
        if let tempTranslatorType: String = dict[CodingKeys.translatorType.rawValue]?.stringValue {
            
            translatorType = tempTranslatorType
        }
        if let tempProfileImageUrl: String = dict[CodingKeys.profileImageUrl.rawValue]?.stringValue {
            
            profileImageUrl = tempProfileImageUrl
        }
        if let tempProfileLinkColor: String = dict[CodingKeys.profileLinkColor.rawValue]?.stringValue {
            
            profileLinkColor = tempProfileLinkColor
        }
        if let tempProfileTextColor: String = dict[CodingKeys.profileTextColor.rawValue]?.stringValue {
            
            profileTextColor = tempProfileTextColor
        }
        if let tempFollowRequestSent: Bool = dict[CodingKeys.isFollowRequestSent.rawValue]?.boolValue {
            
            isFollowRequestSent = tempFollowRequestSent
        }
        if let tempContributorsEnabled: Bool = dict[CodingKeys.hasContributorsEnabled.rawValue]?.boolValue {
            
            hasContributorsEnabled = tempContributorsEnabled
        }
        if let tempHasExtendedProfile: Bool = dict[CodingKeys.hasExtendedProfile.rawValue]?.boolValue {
            
            hasExtendedProfile = tempHasExtendedProfile
        }
        if let tempDefaultProfileImage: Bool = dict[CodingKeys.hasDefaultProfileImage.rawValue]?.boolValue {
            
            hasDefaultProfileImage = tempDefaultProfileImage
        }
        if let tempIsTranslationEnabled: Bool = dict[CodingKeys.isTranslationEnabled.rawValue]?.boolValue {
            
            isTranslationEnabled = tempIsTranslationEnabled
        }
        if let tempProfileBackgroundTile: Bool = dict[CodingKeys.hasProfileBackgroundTile.rawValue]?.boolValue {
            
            hasProfileBackgroundTile = tempProfileBackgroundTile
        }
        if let tempProfileImageUrlHttps: String = dict[CodingKeys.profileImageUrlHttps.rawValue]?.stringValue {
            
            profileImageUrlHttps = tempProfileImageUrlHttps
        }
        if let tempProfileBackgroundColor: String = dict[CodingKeys.profileBackgroundColor.rawValue]?.stringValue {
            
            profileBackgroundColor = tempProfileBackgroundColor
        }
        if let temppPofileSidebarFillColor: String = dict[CodingKeys.profileSidebarFillColor.rawValue]?.stringValue {
            
            profileSidebarFillColor = temppPofileSidebarFillColor
        }
        if let tempProfileBackgroundImageUrl: String = dict[CodingKeys.profileBackgroundImageUrl.rawValue]?.stringValue {
            
            profileBackgroundImageUrl = tempProfileBackgroundImageUrl
        }
        if let tempProfileSidebarBorderColor: String = dict[CodingKeys.profileSidebarBorderColor.rawValue]?.stringValue {
            
            profileSidebarBorderColor = tempProfileSidebarBorderColor
        }
        if let temppPofileUseBackgroundImage: Bool = dict[CodingKeys.isProfileUsingBackgroundImage.rawValue]?.boolValue {
            
            isProfileUsingBackgroundImage = temppPofileUseBackgroundImage
        }
        if let tempProfileBackgroundImageUrlHttps: String = dict[CodingKeys.profileBackgroundImageUrlHttps.rawValue]?.stringValue {
            
            profileBackgroundImageUrlHttps = tempProfileBackgroundImageUrlHttps
        }
    }
    
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let dictionary: JSON = JSON(fromCache)
        self.inititialize(dict: dictionary.dictionaryValue)
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.friendsCount.rawValue: self.friendsCount,
            CodingKeys.userID.rawValue: self.userID,
            CodingKeys.language.rawValue: self.lang,
            CodingKeys.favoritesCount.rawValue: self.favouritesCount,
            CodingKeys.statusesCount.rawValue: self.statusesCount,
            CodingKeys.listedCount.rawValue: self.listedCount,
            CodingKeys.screenName.rawValue: self.screenName,
            CodingKeys.name.rawValue: self.name,
            CodingKeys.followersCount.rawValue: self.followersCount,
            CodingKeys.location.rawValue: self.location,
            CodingKeys.isVerified.rawValue: self.isVerified,
            CodingKeys.isFollowing.rawValue: self.isFollowing,
            CodingKeys.isProtected.rawValue: self.isProtected,
            CodingKeys.timeZone.rawValue: self.timeZone ?? "",
            CodingKeys.createdAt.rawValue: self.createdAt,
            CodingKeys.utcOffset.rawValue: self.utcOffset ?? "",
            CodingKeys.description.rawValue: self.description,
            CodingKeys.isGeoEnabled.rawValue: self.isGeoEnabled,
            CodingKeys.isTranslator.rawValue: self.isTranslator,
            CodingKeys.hasNotifications.rawValue: self.hasNotifications,
            CodingKeys.isDefaultProfile.rawValue: self.isDefaultProfile,
            CodingKeys.translatorType.rawValue: self.translatorType,
            CodingKeys.profileImageUrl.rawValue: self.profileImageUrl,
            CodingKeys.profileLinkColor.rawValue: self.profileLinkColor,
            CodingKeys.profileTextColor.rawValue: self.profileTextColor,
            CodingKeys.isFollowRequestSent.rawValue: self.isFollowRequestSent,
            CodingKeys.hasContributorsEnabled.rawValue: self.hasContributorsEnabled,
            CodingKeys.hasExtendedProfile.rawValue: self.hasExtendedProfile,
            CodingKeys.hasDefaultProfileImage.rawValue: self.hasDefaultProfileImage,
            CodingKeys.isTranslationEnabled.rawValue: self.isTranslationEnabled,
            CodingKeys.hasProfileBackgroundTile.rawValue: self.hasProfileBackgroundTile,
            CodingKeys.profileImageUrlHttps.rawValue: self.profileImageUrlHttps,
            CodingKeys.profileBackgroundColor.rawValue: self.profileBackgroundColor,
            CodingKeys.profileSidebarFillColor.rawValue: self.profileSidebarFillColor,
            CodingKeys.profileBackgroundImageUrl.rawValue: self.profileBackgroundImageUrl,
            CodingKeys.profileSidebarBorderColor.rawValue: self.profileSidebarBorderColor,
            CodingKeys.isProfileUsingBackgroundImage.rawValue: self.isProfileUsingBackgroundImage,
            CodingKeys.profileBackgroundImageUrlHttps.rawValue: self.profileBackgroundImageUrlHttps
        ]
    }
}
