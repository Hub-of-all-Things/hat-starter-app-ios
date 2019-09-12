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

public struct HATStuffToRemember: HatApiType, Comparable {

    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `title` in JSON is `title`
     * `body` in JSON is `body`
     * `unixTimeStamp` in JSON is `unixTimeStamp`
     */
    private enum CodingKeys: String, CodingKey {
        
        case title
        case body
        case unixTimeStamp
    }
    
    // MARK: - Comparable protocol methods
    
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
    public static func < (lhs: HATStuffToRemember, rhs: HATStuffToRemember) -> Bool {
        
        if lhs.unixTimeStamp != nil && rhs.unixTimeStamp != nil {
            
            return lhs.unixTimeStamp! < rhs.unixTimeStamp!
        }
        
        return false
    }
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATStuffToRemember, rhs: HATStuffToRemember) -> Bool {
        
        return (lhs.body == rhs.body && lhs.title == rhs.title && lhs.unixTimeStamp == rhs.unixTimeStamp)
    }
    
    // MARK: - Variables
    
    /// Title of the stuff to remember
    public var title: String = ""
    /// Body of the stuff to remember
    public var body: String = ""
    
    /// The unix time stamp of the record
    public var unixTimeStamp: Int?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        title = ""
        body = ""
        
        unixTimeStamp = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        self.init()
        
        if let tempData: [String: JSON] = dictionary["data"]?.dictionaryValue {
            
            if let tempBody: String = tempData[CodingKeys.body.rawValue]?.stringValue {
                
                self.body = tempBody
            }
            
            if let tempTitle: String = tempData[CodingKeys.title.rawValue]?.stringValue {
                
                self.title = tempTitle
            }
            
            if let tempUnixTimeStamp: Int = tempData[CodingKeys.unixTimeStamp.rawValue]?.intValue {
                
                self.unixTimeStamp = tempUnixTimeStamp
            }
        }
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        if let tempBody: Any = fromCache[CodingKeys.body.rawValue] {
            
            self.body = String(describing: tempBody)
        }
        
        if let tempTitle: Any = fromCache[CodingKeys.title.rawValue] {
            
            self.title = String(describing: tempTitle)
        }
        
        if let tempUnixTimeStamp: Int = fromCache[CodingKeys.unixTimeStamp.rawValue] as? Int {
            
            self.unixTimeStamp = tempUnixTimeStamp
        }
    }
    
    // MARK: - To JSON
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.body.rawValue: self.body,
            CodingKeys.title.rawValue: self.title,
            CodingKeys.unixTimeStamp.rawValue: Date().timeIntervalSince1970
        ]
    }
}
