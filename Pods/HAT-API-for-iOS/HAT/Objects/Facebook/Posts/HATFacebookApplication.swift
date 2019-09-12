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

/// A struct representing the application that this post came from
public struct HATFacebookApplication: HatApiType, Comparable, HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `applicationID` in JSON is `id`
     * `namespace` in JSON is `namespace`
     * `name` in JSON is `name`
     * `category` in JSON is `category`
     * `link` in JSON is `link`
     */
    private enum CodingKeys: String, CodingKey {
        
        case applicationID = "id"
        case namespace = "namespace"
        case name = "name"
        case category = "category"
        case link = "link"
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
    public static func == (lhs: HATFacebookApplication, rhs: HATFacebookApplication) -> Bool {

        return (lhs.applicationID == rhs.applicationID && lhs.namespace == rhs.namespace && lhs.name == rhs.name && lhs.category == rhs.category && lhs.link == rhs.link)
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
    public static func < (lhs: HATFacebookApplication, rhs: HATFacebookApplication) -> Bool {

        return lhs.name < rhs.name
    }

    // MARK: - Variables

    /// The id of the application
    public var applicationID: String = ""
    /// The namespace of the application
    public var namespace: String = ""
    /// The name of the application
    public var name: String = ""
    /// The category of the application
    public var category: String = ""
    /// The url of the application
    public var link: String = ""

    // MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        applicationID = ""
        namespace = ""
        name = ""
        category = ""
        link = ""
    }

    /**
     It initialises everything from the received JSON file from HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {

        self.init()

        if let tempID: String = dictionary[CodingKeys.applicationID.rawValue]?.stringValue {

            applicationID = tempID
        }
        if let tempNameSpace: String = dictionary[CodingKeys.namespace.rawValue]?.stringValue {

            namespace = tempNameSpace
        }
        if let tempName: String = dictionary[CodingKeys.name.rawValue]?.string {

            name = tempName
        }
        if let tempCategory: String = dictionary[CodingKeys.category.rawValue]?.stringValue {

            category = tempCategory
        }
        if let tempLink: String = dictionary[CodingKeys.link.rawValue]?.stringValue {

            link = tempLink
        }
    }
    
    /**
     It initialises everything from the received JSON file from HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempID: String = dict[CodingKeys.applicationID.rawValue]?.stringValue {
            
            applicationID = tempID
        }
        if let tempNameSpace: String = dict[CodingKeys.namespace.rawValue]?.stringValue {
            
            namespace = tempNameSpace
        }
        if let tempName: String = dict[CodingKeys.name.rawValue]?.string {
            
            name = tempName
        }
        if let tempCategory: String = dict[CodingKeys.category.rawValue]?.stringValue {
            
            category = tempCategory
        }
        if let tempLink: String = dict[CodingKeys.link.rawValue]?.stringValue {
            
            link = tempLink
        }
    }
    
    /**
     It initialises everything from the received JSON file from the cache
     
     - fromCache: The Dictionary file returned from cache
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
            CodingKeys.applicationID.rawValue: self.applicationID,
            CodingKeys.category.rawValue: self.category,
            CodingKeys.link.rawValue: self.link
        ]
    }
}
