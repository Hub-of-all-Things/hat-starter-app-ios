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

/// A struct representing the privacy settings of the post
public struct HATFacebookPrivacy: HatApiType, Comparable, HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `friends` in JSON is `friends`
     * `value` in JSON is `value`
     * `deny` in JSON is `deny`
     * `description` in JSON is `description`
     * `allow` in JSON is `allow`
     */
    private enum CodingKeys: String, CodingKey {
        
        case friends
        case value
        case deny
        case description
        case allow
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
    public static func == (lhs: HATFacebookPrivacy, rhs: HATFacebookPrivacy) -> Bool {

        return (lhs.friends == rhs.friends && lhs.value == rhs.value && lhs.deny == rhs.deny && lhs.description == rhs.description && lhs.allow == rhs.allow)
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
    public static func < (lhs: HATFacebookPrivacy, rhs: HATFacebookPrivacy) -> Bool {

        return lhs.description < rhs.description
    }

    // MARK: - Variables

    /// Is it friends only?
    public var friends: String = ""
    /// The value. Possible values are SELF(private, only me) and ALL_FRIENDS(when it's set to public)
    public var value: String = ""
    /// deny access?
    public var deny: String = ""
    /// The desctiption of the setting, Only me or All Friends
    public var description: String = ""
    /// Allow?
    public var allow: String = ""

    // MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        friends = ""
        value = ""
        deny = ""
        description = ""
        allow = ""
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {

        self.init()

        if let tempFriends: String = dictionary[CodingKeys.friends.rawValue]?.stringValue {

            friends = tempFriends
        }
        if let tempValue: String = dictionary[CodingKeys.value.rawValue]?.stringValue {

            value = tempValue
        }
        if let tempDeny: String = dictionary[CodingKeys.deny.rawValue]?.string {

            deny = tempDeny
        }
        if let tempDescription: String = dictionary[CodingKeys.description.rawValue]?.stringValue {

            description = tempDescription
        }
        if let tempAllow: String = dictionary[CodingKeys.allow.rawValue]?.stringValue {

            allow = tempAllow
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempFriends: String = dict[CodingKeys.friends.rawValue]?.stringValue {
            
            friends = tempFriends
        }
        if let tempValue: String = dict[CodingKeys.value.rawValue]?.stringValue {
            
            value = tempValue
        }
        if let tempDeny: String = dict[CodingKeys.deny.rawValue]?.string {
            
            deny = tempDeny
        }
        if let tempDescription: String = dict[CodingKeys.description.rawValue]?.stringValue {
            
            description = tempDescription
        }
        if let tempAllow: String = dict[CodingKeys.allow.rawValue]?.stringValue {
            
            allow = tempAllow
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
            
            CodingKeys.friends.rawValue: self.friends,
            CodingKeys.deny.rawValue: self.deny,
            CodingKeys.value.rawValue: self.value,
            CodingKeys.description.rawValue: self.description,
            CodingKeys.allow.rawValue: self.allow
        ]
    }
}
