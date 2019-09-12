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

/// A class representing the actual data of the tweet
public struct HATTwitterDataTweetsSocialFeedObject: HatApiType, Comparable {
    
    // MARK: - Fields
    
    /// The possible Fields of the JSON struct
    public struct Fields {
        
        static let source: String = "source"
        static let truncated: String = "truncated"
        static let retweetCount: String = "retweet_count"
        static let retweeted: String = "retweeted"
        static let favoriteCount: String = "favorite_count"
        static let tweetID: String = "id"
        static let text: String = "text"
        static let createdAt: String = "created_at"
        static let followersCount: String = "followers_count"
        static let favorited: String = "favorited"
        static let language: String = "lang"
        static let user: String = "user"
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
    public static func == (lhs: HATTwitterDataTweetsSocialFeedObject, rhs: HATTwitterDataTweetsSocialFeedObject) -> Bool {
        
        return (lhs.source == rhs.source && lhs.truncated == rhs.truncated && lhs.retweetCount == rhs.retweetCount
            && lhs.retweeted == rhs.retweeted && lhs.favoriteCount == rhs.favoriteCount && lhs.tweetID == rhs.tweetID && lhs.text == rhs.text && lhs.favorited == rhs.favorited && lhs.lang == rhs.lang)
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
    public static func < (lhs: HATTwitterDataTweetsSocialFeedObject, rhs: HATTwitterDataTweetsSocialFeedObject) -> Bool {
        
        if lhs.createdAt != nil && rhs.createdAt != nil {
            
            return lhs.createdAt! < rhs.createdAt!
        } else if lhs.createdAt != nil && rhs.createdAt == nil {
            
            return false
        } else {
            
            return true
        }
    }
    
    // MARK: - Variables
    
    /// The source of the tweet
    public var source: String = ""
    /// Shows if the tweet is truncated or not
    public var truncated: String = ""
    /// Shows the retweet count
    public var retweetCount: String = ""
    /// Shows if the tweet has been retweeted
    public var retweeted: String = ""
    /// Shows the tweet's favourites count
    public var favoriteCount: String = ""
    /// Shows the tweet's id
    public var tweetID: String = ""
    /// Shows the text of the tweet
    public var text: String = ""
    /// Shows if the tweet is favourited or not
    public var favorited: String = ""
    /// Shows the language of the tweet
    public var lang: String = ""
    
    /// Shows the date that the tweet has been created
    public var createdAt: Date?
    
    /// Shows the user's info
    public var user: HATTwitterDataTweetsUsersSocialFeedObject = HATTwitterDataTweetsUsersSocialFeedObject()
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        source = ""
        truncated = ""
        retweetCount = ""
        retweeted = ""
        favoriteCount = ""
        tweetID = ""
        text = ""
        createdAt = nil
        favorited = ""
        lang = ""
        user = HATTwitterDataTweetsUsersSocialFeedObject()
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received from the HAT
     */
    public init(from dictionary: Dictionary<String, JSON>) {
        
        self.init()
        
        self.inititialize(dict: dictionary)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempSource = dict[Fields.source]?.stringValue {
            
            source = tempSource
        }
        if let tempTruncated = dict[Fields.truncated]?.stringValue {
            
            truncated = tempTruncated
        }
        if let tempRetweetCount = dict[Fields.retweetCount]?.stringValue {
            
            retweetCount = tempRetweetCount
        }
        if let tempRetweeted = dict[Fields.retweeted]?.stringValue {
            
            retweeted = tempRetweeted
        }
        if let tempFavouriteCount = dict[Fields.favoriteCount]?.stringValue {
            
            favoriteCount = tempFavouriteCount
        }
        if let tempID = dict[Fields.tweetID]?.stringValue {
            
            tweetID = tempID
        }
        if let tempText = dict[Fields.text]?.stringValue {
            
            text = tempText
        }
        if let tempCreatedAt = dict[Fields.createdAt]?.stringValue {
            
            createdAt = HATFormatterHelper.formatStringToDate(string: tempCreatedAt)
        }
        if let tempFavorited = dict[Fields.favorited]?.stringValue {
            
            favorited = tempFavorited
        }
        if let tempLang = dict[Fields.language]?.stringValue {
            
            lang = tempLang
        }
        if let tempUser = dict[Fields.user]?.dictionaryValue {
            
            user = HATTwitterDataTweetsUsersSocialFeedObject(from: tempUser)
        }
    }
    
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let dictionary = JSON(fromCache)
        self.inititialize(dict: dictionary.dictionaryValue)
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            Fields.source: self.source,
            Fields.truncated: self.truncated,
            Fields.retweetCount: self.retweetCount,
            Fields.retweeted: self.retweeted,
            Fields.favoriteCount: self.favoriteCount,
            Fields.tweetID: self.tweetID,
            Fields.text: self.text,
            Fields.createdAt: HATFormatterHelper.formatDateToISO(date: self.createdAt ?? Date()),
            Fields.favorited: self.favorited,
            Fields.language: self.lang,
            Fields.user: self.user.toJSON()
        ]
    }
}
