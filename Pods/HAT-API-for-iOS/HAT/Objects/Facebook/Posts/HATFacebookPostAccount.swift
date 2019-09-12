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

/// A struct representing the user's details that made the post
public struct HATFacebookPostAccount: HatApiType, Comparable, HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `userID` in JSON is `id`
     * `name` in JSON is `name`
     */
    private enum CodingKeys: String, CodingKey {
        
        case userID = "id"
        case name = "name"
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
    public static func == (lhs: HATFacebookPostAccount, rhs: HATFacebookPostAccount) -> Bool {

        return (lhs.name == rhs.name && lhs.userID == rhs.userID)
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
    public static func < (lhs: HATFacebookPostAccount, rhs: HATFacebookPostAccount) -> Bool {

        return lhs.name < rhs.name
    }

    // MARK: - Variables

    /// The user's name
    public var name: String = ""
    /// The user's id
    public var userID: String = ""

    // MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        name = ""
        userID = ""
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {

        self.init()

        if let tempName: String = dictionary[CodingKeys.name.rawValue]?.stringValue {

            name = tempName
        }
        if let tempID: String = dictionary[CodingKeys.userID.rawValue]?.stringValue {

            userID = tempID
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempName: String = dict[CodingKeys.name.rawValue]?.stringValue {
            
            name = tempName
        }
        if let tempID: String = dict[CodingKeys.userID.rawValue]?.stringValue {
            
            userID = tempID
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
            
            CodingKeys.name.rawValue: self.name,
            CodingKeys.userID.rawValue: self.userID
        ]
    }
}
