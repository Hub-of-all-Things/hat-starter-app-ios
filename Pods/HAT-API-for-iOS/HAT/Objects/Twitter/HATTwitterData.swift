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

/// A struct representing the data of the tweet
public struct HATTwitterData: HatApiType, Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATTwitterData, rhs: HATTwitterData) -> Bool {
        
        return (lhs.tweets == rhs.tweets)
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
    public static func < (lhs: HATTwitterData, rhs: HATTwitterData) -> Bool {
        
        return lhs.tweets < rhs.tweets
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `tweets` in JSON is `tweets`
     */
    private enum CodingKeys: String, CodingKey {
        
        case tweets
    }
    
    // MARK: - Variables
    
    /// The tweet data
    public var tweets: HATTwitterTweets = HATTwitterTweets()
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        tweets = HATTwitterTweets()
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
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
        
        if let tempTweets: [String: JSON] = dict[CodingKeys.tweets.rawValue]?.dictionaryValue {
            
            tweets = HATTwitterTweets(from: tempTweets)
        } else {
            
            tweets = HATTwitterTweets(from: dict)
        }
    }
    
    /**
     It initialises everything from the received JSON file from the cache
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
            
            CodingKeys.tweets.rawValue: self.tweets.toJSON()
        ]
    }
}
