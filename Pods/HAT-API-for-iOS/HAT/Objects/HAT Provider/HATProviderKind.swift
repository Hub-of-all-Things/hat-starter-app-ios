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

/// A struct representing the hat provider kind object
public struct HATProviderKind: HATObject, Comparable {

    // MARK: - Comparable protocol

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATProviderKind, rhs: HATProviderKind) -> Bool {

        return (lhs.kind == rhs.kind && lhs.domain == rhs.domain && lhs.country == rhs.country && lhs.url == rhs.url)
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
    public static func < (lhs: HATProviderKind, rhs: HATProviderKind) -> Bool {

        return lhs.kind < rhs.kind
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `kind` in JSON is `kind`
     * `domain` in JSON is `domain`
     * `country` in JSON is `country`
     * `url` in JSON is `link`
     */
    private enum CodingKeys: String, CodingKey {
        
        case kind = "kind"
        case domain = "domain"
        case country = "country"
        case url = "link"
    }

    // MARK: - Variables

    /// The hat provider's kind type,
    public var kind: String = ""
    /// The hat provider's kind domain, hubat.net, hubofallthings.net etc
    public var domain: String = ""
    /// The hat provider's kind country. For now it's always UK
    public var country: String = ""
    /// The hat provider's kind url, a webpage
    public var url: String = ""

    // MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        kind = ""
        domain = ""
        country = ""
        url = ""
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {

        self.init()

        if let tempKind: String = dictionary[CodingKeys.kind.rawValue]?.stringValue {

            kind = tempKind
        }
        if let tempDomain: String = dictionary[CodingKeys.domain.rawValue]?.stringValue {

            domain = tempDomain
        }
        if let tempCountry: String = dictionary[CodingKeys.country.rawValue]?.stringValue {

            country = tempCountry
        }
        if let tempLink: String = dictionary[CodingKeys.url.rawValue]?.stringValue {

            url = tempLink
        }
    }
}
