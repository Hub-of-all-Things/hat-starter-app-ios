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

/// A struct representing the hat provider object
public struct HATProvider: HATObject, Comparable {

    // MARK: - Comparable protocol

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATProvider, rhs: HATProvider) -> Bool {

        return (lhs.sku == rhs.sku && lhs.name == rhs.name && lhs.description == rhs.description && lhs.details == rhs.details && lhs.imageURL == rhs.imageURL && lhs.price == rhs.price && lhs.availableHats == rhs.availableHats && lhs.purchasedHats == rhs.purchasedHats && lhs.ordering == rhs.ordering && lhs.features == rhs.features && lhs.hatProviderImage == rhs.hatProviderImage && lhs.category == rhs.category && lhs.kind == rhs.kind && lhs.paymentType == rhs.paymentType)
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
    public static func < (lhs: HATProvider, rhs: HATProvider) -> Bool {

        return lhs.ordering < rhs.ordering
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `sku` in JSON is `sku`
     * `name` in JSON is `name`
     * `description` in JSON is `description`
     * `details` in JSON is `details`
     * `imageURL` in JSON is `illustration`
     * `price` in JSON is `price`
     * `availableHats` in JSON is `available`
     * `purchasedHats` in JSON is `purchased`
     * `ordering` in JSON is `ordering`
     * `features` in JSON is `features`
     * `category` in JSON is `category`
     * `kind` in JSON is `kind`
     * `paymentType` in JSON is `paymentType`
     */
    private enum CodingKeys: String, CodingKey {
        
        case sku = "sku"
        case name = "name"
        case description = "description"
        case details = "details"
        case imageURL = "illustration"
        case price = "price"
        case availableHats = "available"
        case purchasedHats = "purchased"
        case ordering = "ordering"
        case features = "features"
        case category = "category"
        case kind = "kind"
        case paymentType = "paymentType"
    }

    // MARK: - Variables

    /// The hat provider's sku number
    public var sku: String = ""
    /// The hat provider's name
    public var name: String = ""
    /// The hat provider's description
    public var description: String = ""
    /// The hat provider's details
    public var details: String = ""
    /// The hat provider's illustration url
    public var imageURL: String = ""

    /// The hat provider's price
    public var price: Int = 0
    /// The hat provider's available hats remaining
    public var availableHats: Int = 0
    /// The hat provider's purchased hats so far
    public var purchasedHats: Int = 0
    /// The hat provider's ordering
    public var ordering: Int = 0

    /// The hat provider's hat features
    public var features: [String] = []

    /// The hat provider's image. used for caching the downloaded image
    public var hatProviderImage: UIImage?

    /// The hat provider's category information
    public var category: HATProviderCategory = HATProviderCategory()
    /// The hat provider's kind information
    public var kind: HATProviderKind = HATProviderKind()
    /// The hat provider's payment information
    public var paymentType: HATProviderPayment = HATProviderPayment()

    // MARK: Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        sku = ""
        name = ""
        description = ""
        details = ""
        imageURL = ""

        price = 0
        availableHats = 0
        purchasedHats = 0
        ordering = 0

        features = []

        hatProviderImage = nil

        category = HATProviderCategory()
        kind = HATProviderKind()
        paymentType = HATProviderPayment()
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {

        self.init()

        if let tempSKU: String = dictionary[CodingKeys.sku.rawValue]?.stringValue {

            sku = tempSKU
        }
        if let tempName: String = dictionary[CodingKeys.name.rawValue]?.stringValue {

            name = tempName
        }
        if let tempDescription: String = dictionary[CodingKeys.description.rawValue]?.stringValue {

            description = tempDescription
        }
        if let tempDetails: String = dictionary[CodingKeys.details.rawValue]?.stringValue {

            details = tempDetails
        }
        if let tempIllustration: String = dictionary[CodingKeys.imageURL.rawValue]?.stringValue {

            imageURL = tempIllustration
        }

        if let tempPrice: Int = dictionary[CodingKeys.price.rawValue]?.intValue {

            price = tempPrice
        }
        if let tempAvailable: Int = dictionary[CodingKeys.availableHats.rawValue]?.intValue {

            availableHats = tempAvailable
        }
        if let tempPurchased: Int = dictionary[CodingKeys.purchasedHats.rawValue]?.intValue {

            purchasedHats = tempPurchased
        }
        if let tempOrdering: Int = dictionary[CodingKeys.ordering.rawValue]?.intValue {

            ordering = tempOrdering
        }

        if let tempFeatures: [JSON] = dictionary[CodingKeys.features.rawValue]?.arrayValue {

            for item: JSON in tempFeatures {

               features.append(item.stringValue)
            }
        }

        if let tempKind: [String: JSON] = dictionary[CodingKeys.kind.rawValue]?.dictionaryValue {

            kind = HATProviderKind(from: tempKind)
        }
        if let tempPaymentType: [String: JSON] = dictionary[CodingKeys.paymentType.rawValue]?.dictionaryValue {

            paymentType = HATProviderPayment(from: tempPaymentType)
        }
        if let tempCategory: [String: JSON] = dictionary[CodingKeys.category.rawValue]?.dictionaryValue {

            category = HATProviderCategory(from: tempCategory)
        }
    }
}
