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

/// A struct representing the facebook social feed object
public struct HATFacebook: HatApiType, HATSocialFeedObject, Comparable, HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `name` in JSON is `name`
     * `lastUpdated` in JSON is `lastUpdated`
     * `data` in JSON is `data`
     */
    private enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case lastUpdated = "lastUpdated"
        case data = "data"
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
    public static func == (lhs: HATFacebook, rhs: HATFacebook) -> Bool {
        
        return (lhs.name == rhs.name && lhs.data == rhs.data && lhs.lastUpdated == rhs.lastUpdated)
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
    public static func < (lhs: HATFacebook, rhs: HATFacebook) -> Bool {
        
        if lhs.lastUpdated != nil && rhs.lastUpdated != nil {
            
            return lhs.lastUpdated! < rhs.lastUpdated!
        } else if lhs.lastUpdated != nil && rhs.lastUpdated == nil {
            
            return false
        } else {
            
            return true
        }
    }
    
    // MARK: - Protocol's variables
    
    public var protocolLastUpdate: Date?
    
    // MARK: - Class' variables
    
    /// The name of the record in database
    public var name: String = ""
    
    /// The actual data of the record
    public var data: HATFacebookData = HATFacebookData()
    
    /// The date the post was last updated
    public var lastUpdated: Date?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        name = ""
        data = HATFacebookData()
        lastUpdated = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dict: Dictionary<String, JSON>) {
        
        self.init()
        
        self.inititialize(dict: dict)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempName: String = dict[CodingKeys.name.rawValue]?.stringValue {
            
            name = tempName
        }
        if let tempLastUpdated: String = dict[CodingKeys.lastUpdated.rawValue]?.stringValue {
            
            lastUpdated = HATFormatterHelper.formatStringToDate(string: tempLastUpdated)
            protocolLastUpdate = lastUpdated
        }
        if let tempData: [String: JSON] = dict[CodingKeys.data.rawValue]?.dictionaryValue {
            
            data = HATFacebookData(from: tempData)
            self.lastUpdated = data.posts.updatedTime
            protocolLastUpdate = self.lastUpdated
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public init(fromV2 dict: Dictionary<String, JSON>) {
        
        self.init()
        
        self.inititialize(dict: dict)
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
            CodingKeys.data.rawValue: self.data.toJSON(),
            CodingKeys.lastUpdated.rawValue: self.lastUpdated ?? Date()
        ]
    }
}
