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

/// A struct representing the actual data of the post
public struct HATFacebookPost: HatApiType, Comparable, HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `userCreatedPost` in JSON is `from`
     * `postID` in JSON is `id`
     * `statusType` in JSON is `status_type`
     * `privacySettings` in JSON is `privacy`
     * `updatedTime` in JSON is `updated_time`
     * `type` in JSON is `type`
     * `createdTime` in JSON is `created_time`
     * `message` in JSON is `message`
     * `fullPictureURL` in JSON is `full_picture`
     * `link` in JSON is `link`
     * `picture` in JSON is `picture`
     * `story` in JSON is `story`
     * `description` in JSON is `description`
     * `objectID` in JSON is `object_id`
     * `application` in JSON is `application`
     * `caption` in JSON is `caption`
     * `place` in JSON is `place`
     */
    private enum CodingKeys: String, CodingKey {
        
        case userCreatedPost = "from"
        case postID = "id"
        case statusType = "status_type"
        case privacySettings = "privacy"
        case updatedTime = "updated_time"
        case type = "type"
        case createdTime = "created_time"
        case message = "message"
        case fullPictureURL = "full_picture"
        case link = "link"
        case smallPictureURL = "picture"
        case story = "story"
        case description = "description"
        case objectID = "object_id"
        case application = "application"
        case caption = "caption"
        case place = "place"
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
    public static func == (lhs: HATFacebookPost, rhs: HATFacebookPost) -> Bool {
        
        return (lhs.userCreatedPost == rhs.userCreatedPost && lhs.privacySettings == rhs.privacySettings && lhs.updatedTime == rhs.updatedTime && lhs.createdTime == rhs.createdTime && lhs.postID == rhs.postID && lhs.message == rhs.message && lhs.statusType == rhs.statusType && lhs.type == rhs.type && lhs.fullPictureURL == rhs.fullPictureURL && lhs.link == rhs.link && lhs.smallPictureURL == rhs.smallPictureURL && lhs.story == rhs.story && lhs.name == rhs.name && lhs.description == rhs.description && lhs.objectID == rhs.objectID && lhs.caption == rhs.caption && lhs.application == rhs.application)
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
    public static func < (lhs: HATFacebookPost, rhs: HATFacebookPost) -> Bool {
        
        if lhs.updatedTime != nil && rhs.updatedTime != nil {
            
            return lhs.updatedTime! < rhs.updatedTime!
        } else if lhs.updatedTime != nil && rhs.updatedTime == nil {
            
            return false
        }
        
        return true
    }
    
    // MARK: - Variables
    
    /// The user that created the post
    public var userCreatedPost: HATFacebookPostAccount = HATFacebookPostAccount()
    
    /// The privacy settings for the post selected from the user when creating the post, like only visible to be or visible to All Friends
    public var privacySettings: HATFacebookPrivacy = HATFacebookPrivacy()
    
    /// The updated time of the post. This will be different than the `createdTime` in the case the post has been edited
    public var updatedTime: Date?
    /// The created time of the post
    public var createdTime: Date?
    
    /// The message of the post. The main text that the user posted
    public var message: String = ""
    /// The id of the post
    public var postID: String = ""
    /// The status type of the post. Possible values include: wall_post, shared_story, mobile_status_update, etc.
    public var statusType: String = ""
    /// The type of the post, status, video, image, etc,
    public var type: String = ""
    
    /// The full resolution picture url
    public var fullPictureURL: String = ""
    /// If the post has a link to somewhere has the url
    public var link: String = ""
    /// The small picture url
    public var smallPictureURL: String = ""
    /// The story of the post. Can be something like "userA is with userB" or "userA shared userB's video"
    public var story: String = ""
    /// The name of the post. Something like a title to the post. Sometimes is the user's profile name, others is something like a title of an image you shared
    public var name: String = ""
    /// The description of the post. Something like a short description to the post. Sometimes is the user's profile name, others is something like a title of an image you shared
    public var description: String = ""
    /// The object id of the post
    public var objectID: String = ""
    /// The caption of the post. Sometimes is the user's profile name, others is something like a title of an image you shared
    public var caption: String = ""
    
    /// The application details of the post, if this post came from an application. Else can be empty
    public var application: HATFacebookApplication = HATFacebookApplication()
    
    /// If the post includes a location this will be included here. Optional
    public var place: HATFacebookPlace?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        userCreatedPost = HATFacebookPostAccount()
        postID = ""
        statusType = ""
        privacySettings = HATFacebookPrivacy()
        updatedTime = Date()
        type = ""
        createdTime = Date()
        message = ""
        
        fullPictureURL = ""
        link = ""
        smallPictureURL = ""
        story = ""
        name = ""
        description = ""
        objectID = ""
        application = HATFacebookApplication()
        caption = ""
        place = HATFacebookPlace()
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {
        
        self.init()
        
        self.inititialize(dict: dictionary)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempFrom: [String: JSON] = dict[CodingKeys.userCreatedPost.rawValue]?.dictionaryValue {
            
            userCreatedPost = HATFacebookPostAccount(from: tempFrom)
        }
        if let tempID: String = dict[CodingKeys.postID.rawValue]?.stringValue {
            
            postID = tempID
        }
        if let tempStatusType: String = dict[CodingKeys.statusType.rawValue]?.stringValue {
            
            statusType = tempStatusType
        }
        if let tempPrivacy: [String: JSON] = dict[CodingKeys.privacySettings.rawValue]?.dictionaryValue {
            
            privacySettings = HATFacebookPrivacy(from: tempPrivacy)
        }
        if let tempUpdateTime: String = dict[CodingKeys.updatedTime.rawValue]?.stringValue {
            
            updatedTime = HATFormatterHelper.formatStringToDate(string: tempUpdateTime)
        }
        if let tempType: String = dict[CodingKeys.type.rawValue]?.stringValue {
            
            type = tempType
        }
        if let tempCreatedTime: String = dict[CodingKeys.createdTime.rawValue]?.stringValue {
            
            createdTime = HATFormatterHelper.formatStringToDate(string: tempCreatedTime)
        }
        if let tempMessage: String = dict[CodingKeys.message.rawValue]?.stringValue {
            
            message = tempMessage
        }
        if let tempFullPicture: String = dict[CodingKeys.fullPictureURL.rawValue]?.stringValue {
            
            fullPictureURL = tempFullPicture
        }
        if let tempLink: String = dict[CodingKeys.link.rawValue]?.stringValue {
            
            link = tempLink
        }
        if let tempPicture: String = dict[CodingKeys.smallPictureURL.rawValue]?.stringValue {
            
            smallPictureURL = tempPicture
        }
        if let tempStory: String = dict[CodingKeys.story.rawValue]?.stringValue {
            
            story = tempStory
        }
        if let tempDescription: String = dict[CodingKeys.description.rawValue]?.stringValue {
            
            description = tempDescription
        }
        if let tempObjectID: String = dict[CodingKeys.objectID.rawValue]?.stringValue {
            
            objectID = tempObjectID
        }
        if let tempApplication: [String: JSON] = dict[CodingKeys.application.rawValue]?.dictionaryValue {
            
            application = HATFacebookApplication(from: tempApplication)
        }
        if let tempCaption: String = dict[CodingKeys.caption.rawValue]?.stringValue {
            
            caption = tempCaption
        }
        if let tempPlace: [String: JSON] = dict[CodingKeys.place.rawValue]?.dictionaryValue {
            
            place = HATFacebookPlace(from: tempPlace)
        }
    }
    
    /**
     It initialises everything from the received JSON file from the cache
     
     - fromCache: The Dictionary file received from the cache
     */
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
            
            CodingKeys.userCreatedPost.rawValue: self.userCreatedPost.toJSON(),
            CodingKeys.postID.rawValue: self.postID,
            CodingKeys.statusType.rawValue: self.statusType,
            CodingKeys.privacySettings.rawValue: self.privacySettings.toJSON(),
            CodingKeys.updatedTime.rawValue: HATFormatterHelper.formatDateToISO(date: self.updatedTime ?? Date()),
            CodingKeys.type.rawValue: self.type,
            CodingKeys.createdTime.rawValue: HATFormatterHelper.formatDateToISO(date: self.createdTime ?? Date()),
            CodingKeys.message.rawValue: self.message,
            CodingKeys.fullPictureURL.rawValue: self.fullPictureURL,
            CodingKeys.link.rawValue: self.link,
            CodingKeys.smallPictureURL.rawValue: self.smallPictureURL,
            CodingKeys.story.rawValue: self.story,
            CodingKeys.description.rawValue: self.description,
            CodingKeys.objectID.rawValue: self.objectID,
            CodingKeys.application.rawValue: self.application.toJSON(),
            CodingKeys.caption.rawValue: self.caption,
            CodingKeys.place.rawValue: self.place?.toJSON() ?? [:]
        ]
    }
}
