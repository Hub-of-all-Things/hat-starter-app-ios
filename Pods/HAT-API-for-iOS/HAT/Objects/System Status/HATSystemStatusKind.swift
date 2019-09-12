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

/// A struct representing the system status kind object
public struct HATSystemStatusKind: Comparable, HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `metric` in JSON is `metric`
     * `kind` in JSON is `kind`
     * `units` in JSON is `units`
     */
    private enum CodingKeys: String, CodingKey {
        
        case metric
        case kind
        case units
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
    public static func == (lhs: HATSystemStatusKind, rhs: HATSystemStatusKind) -> Bool {
        
        return (lhs.metric == rhs.metric && lhs.kind == rhs.kind && lhs.units == rhs.units)
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
    public static func < (lhs: HATSystemStatusKind, rhs: HATSystemStatusKind) -> Bool {
        
        return lhs.metric < rhs.metric && lhs.kind == rhs.kind
    }
    
    // MARK: - Variables
    
    /// The value of the object
    public var metric: String = ""
    /// The kind of the value of the object
    public var kind: String = ""
    /// The unit type of the value of the object. Optional
    public var units: String?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        metric = ""
        kind = ""
        units = nil
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public init(from dictionary: Dictionary<String, JSON>) {
        
        self.init()
        
        if let tempMetric: String = dictionary[CodingKeys.metric.rawValue]?.stringValue {
            
            metric = tempMetric
        }
        if let tempKind: String = dictionary[CodingKeys.kind.rawValue]?.stringValue {
            
            kind = tempKind
        }
        if let tempUnits: String = dictionary[CodingKeys.units.rawValue]?.stringValue {
            
            units = tempUnits
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.metric.rawValue: self.metric,
            CodingKeys.kind.rawValue: self.kind,
            CodingKeys.units.rawValue: self.units ?? ""
        ]
    }
}
