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

/// A struct representing the hat provider category object
public struct HATProviderCategory: HATObject, Comparable {

    // MARK: - Comparable protocol

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATProviderCategory, rhs: HATProviderCategory) -> Bool {

        return (lhs.categoryID == rhs.categoryID && lhs.title == rhs.title && lhs.description == rhs.description && lhs.imageURL == rhs.imageURL)
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
    public static func < (lhs: HATProviderCategory, rhs: HATProviderCategory) -> Bool {

        return lhs.title < rhs.title
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `categoryID` in JSON is `categoryId`
     * `title` in JSON is `title`
     * `description` in JSON is `description`
     * `imageURL` in JSON is `illustration`
     */
    private enum CodingKeys: String, CodingKey {
        
        case categoryID = "categoryId"
        case title = "title"
        case description = "description"
        case imageURL = "illustration"
    }

    /// MARK: - Variables

    /// The hat provider's category id
    public var categoryID: Int = 0

    /// The hat provider's category title
    public var title: String = ""
    /// The hat provider's category short description
    public var description: String = ""
    /// The hat provider's category image url in order to fetch and display it
    public var imageURL: String = ""

    /// MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        categoryID = 0

        title = ""
        description = ""
        imageURL = ""
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {

        self.init()

        if let tempCategoryId: Int = dictionary[CodingKeys.categoryID.rawValue]?.intValue {

            categoryID = tempCategoryId
        }

        if let tempTitle: String = dictionary[CodingKeys.title.rawValue]?.stringValue {

            title = tempTitle
        }
        if let tempDescription: String = dictionary[CodingKeys.description.rawValue]?.stringValue {

            description = tempDescription
        }
        if let tempIllustration: String = dictionary[CodingKeys.imageURL.rawValue]?.stringValue {

            imageURL = tempIllustration
        }
    }
}
