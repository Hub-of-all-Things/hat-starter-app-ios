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
public struct HATTwitterTweets: HatApiType, Comparable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `source` in JSON is `source`
     * `truncated` in JSON is `truncated`
     * `retweetCount` in JSON is `retweet_count`
     * `retweeted` in JSON is `retweeted`
     * `favoriteCount` in JSON is `favorite_count`
     * `tweetID` in JSON is `id`
     * `text` in JSON is `text`
     * `createdAt` in JSON is `created_at`
     * `followersCount` in JSON is `followers_count`
     * `favorited` in JSON is `favorited`
     * `language` in JSON is `lang`
     * `user` in JSON is `user`
     */
    private enum CodingKeys: String, CodingKey {
        
        case source = "source"
        case truncated = "truncated"
        case retweetCount = "retweet_count"
        case retweeted = "retweeted"
        case favoriteCount = "favorite_count"
        case tweetID = "id"
        case text = "text"
        case createdAt = "created_at"
        case followersCount = "followers_count"
        case favorited = "favorited"
        case language = "lang"
        case user = "user"
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
    public static func == (lhs: HATTwitterTweets, rhs: HATTwitterTweets) -> Bool {
        
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
    public static func < (lhs: HATTwitterTweets, rhs: HATTwitterTweets) -> Bool {
        
        if lhs.createdAt != nil && rhs.createdAt != nil {
            
            return lhs.createdAt! < rhs.createdAt!
        } else if lhs.createdAt != nil && rhs.createdAt == nil {
            
            return false
        }
        
        return true
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
    
    /// Shows the date that the tweet has been created. Optional
    public var createdAt: Date?
    
    /// Shows the user's info
    public var user: HATTwitterUsers = HATTwitterUsers()
    
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
        user = HATTwitterUsers()
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
        
        if let tempSource: String = dict[CodingKeys.source.rawValue]?.stringValue {
            
            source = tempSource
        }
        if let tempTruncated: String = dict[CodingKeys.truncated.rawValue]?.stringValue {
            
            truncated = tempTruncated
        }
        if let tempRetweetCount: String = dict[CodingKeys.retweetCount.rawValue]?.stringValue {
            
            retweetCount = tempRetweetCount
        }
        if let tempRetweeted: String = dict[CodingKeys.retweeted.rawValue]?.stringValue {
            
            retweeted = tempRetweeted
        }
        if let tempFavouriteCount: String = dict[CodingKeys.favoriteCount.rawValue]?.stringValue {
            
            favoriteCount = tempFavouriteCount
        }
        if let tempID: String = dict[CodingKeys.tweetID.rawValue]?.stringValue {
            
            tweetID = tempID
        }
        if let tempText: String = dict[CodingKeys.text.rawValue]?.stringValue {
            
            text = tempText
        }
        if let tempCreatedAt: String = dict[CodingKeys.createdAt.rawValue]?.stringValue {
            
            createdAt = HATFormatterHelper.formatStringToDate(string: tempCreatedAt)
        }
        if let tempFavorited: String = dict[CodingKeys.favorited.rawValue]?.stringValue {
            
            favorited = tempFavorited
        }
        if let tempLang: String = dict[CodingKeys.language.rawValue]?.stringValue {
            
            lang = tempLang
        }
        if let tempUser: [String: JSON] = dict[CodingKeys.user.rawValue]?.dictionaryValue {
            
            user = HATTwitterUsers(from: tempUser)
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
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
            
            CodingKeys.source.rawValue: self.source,
            CodingKeys.truncated.rawValue: self.truncated,
            CodingKeys.retweetCount.rawValue: self.retweetCount,
            CodingKeys.retweeted.rawValue: self.retweeted,
            CodingKeys.favoriteCount.rawValue: self.favoriteCount,
            CodingKeys.tweetID.rawValue: self.tweetID,
            CodingKeys.text.rawValue: self.text,
            CodingKeys.createdAt.rawValue: HATFormatterHelper.formatDateToISO(date: self.createdAt ?? Date()),
            CodingKeys.favorited.rawValue: self.favorited,
            CodingKeys.language.rawValue: self.lang,
            CodingKeys.user.rawValue: self.user.toJSON()
        ]
    }
}
