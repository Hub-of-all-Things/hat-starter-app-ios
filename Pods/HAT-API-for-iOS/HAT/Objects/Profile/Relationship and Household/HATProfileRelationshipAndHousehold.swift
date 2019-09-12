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

public struct HATProfileRelationshipAndHousehold: HatApiType, Comparable {

    // MARK: - Comparable protocol

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATProfileRelationshipAndHousehold, rhs: HATProfileRelationshipAndHousehold) -> Bool {

        return (lhs.relationshipStatus == rhs.relationshipStatus && lhs.typeOfAccomodation == rhs.typeOfAccomodation && lhs.livingSituation == rhs.livingSituation && lhs.livingSituation == rhs.livingSituation && lhs.howManyUsuallyLiveInYourHousehold == rhs.howManyUsuallyLiveInYourHousehold && lhs.householdOwnership == rhs.householdOwnership && lhs.hasChildren == rhs.hasChildren && lhs.additionalDependents == rhs.additionalDependents && lhs.numberOfChildren == rhs.numberOfChildren && lhs.unixTimeStamp == rhs.unixTimeStamp)
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
    public static func < (lhs: HATProfileRelationshipAndHousehold, rhs: HATProfileRelationshipAndHousehold) -> Bool {

        return lhs.unixTimeStamp! < rhs.unixTimeStamp!
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `relationshipStatus` in JSON is `relationshipStatus`
     * `typeOfAccomodation` in JSON is `typeOfAccomodation`
     * `livingSituation` in JSON is `livingSituation`
     * `howManyUsuallyLiveInYourHousehold` in JSON is `howManyUsuallyLiveInYourHousehold`
     * `householdOwnership` in JSON is `householdOwnership`
     * `hasChildren` in JSON is `hasChildren`
     * `additionalDependents` in JSON is `additionalDependents`
     * `recordID` in JSON is `recordID`
     * `numberOfChildren` in JSON is `numberOfChildren`
     * `unixTimeStamp` in JSON is `unixTimeStamp`
     */
    private enum CodingKeys: String, CodingKey {
        
        case relationshipStatus
        case typeOfAccomodation
        case livingSituation
        case howManyUsuallyLiveInYourHousehold
        case householdOwnership
        case hasChildren
        case additionalDependents
        case recordID
        case numberOfChildren
        case unixTimeStamp
    }

    // MARK: - Variables

    /// User's relationship status
    public var relationshipStatus: String = ""
    /// User's type of accomodation
    public var typeOfAccomodation: String = ""
    /// User's living situation
    public var livingSituation: String = ""
    /// User's total people in household
    public var howManyUsuallyLiveInYourHousehold: String = ""
    /// User's household ownership
    public var householdOwnership: String = ""
    /// User has children
    public var hasChildren: String = ""
    /// User's descendants
    public var additionalDependents: String = ""
    /// Record ID
    public var recordID: String = ""
    /// User's children number
    public var numberOfChildren: Int = 0

    /// The date the record was created. Optional
    public var unixTimeStamp: Int?

    // MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        relationshipStatus = ""
        typeOfAccomodation = ""
        livingSituation = ""
        howManyUsuallyLiveInYourHousehold = ""
        householdOwnership = ""
        hasChildren = ""
        additionalDependents = ""
        recordID = ""

        unixTimeStamp = nil
        numberOfChildren = 0
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(from dict: JSON) {

        self.initialize(fromCache: dict.dictionaryValue)
    }
    
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let json: JSON = JSON(fromCache)
        if let data: [String: JSON] = (json["data"].dictionary) {
            
            relationshipStatus = (data[CodingKeys.relationshipStatus.rawValue]!.stringValue)
            typeOfAccomodation = (data[CodingKeys.typeOfAccomodation.rawValue]!.stringValue)
            livingSituation = (data[CodingKeys.livingSituation.rawValue]!.stringValue)
            howManyUsuallyLiveInYourHousehold = (data[CodingKeys.howManyUsuallyLiveInYourHousehold.rawValue]!.stringValue)
            householdOwnership = (data[CodingKeys.householdOwnership.rawValue]!.stringValue)
            hasChildren = (data[CodingKeys.hasChildren.rawValue]!.stringValue)
            additionalDependents = (data[CodingKeys.additionalDependents.rawValue]!.stringValue)
            numberOfChildren = (data[CodingKeys.numberOfChildren.rawValue]!.intValue)
            
            if let time: String = (data[CodingKeys.unixTimeStamp.rawValue]?.stringValue) {
                
                unixTimeStamp = Int(time)
            }
        }
        
        recordID = (json[CodingKeys.recordID.rawValue].stringValue)
    }

    // MARK: - JSON Mapper

    public func toJSON() -> Dictionary<String, Any> {

        return [

            CodingKeys.relationshipStatus.rawValue: self.relationshipStatus,
            CodingKeys.typeOfAccomodation.rawValue: self.typeOfAccomodation,
            CodingKeys.livingSituation.rawValue: self.livingSituation,
            CodingKeys.howManyUsuallyLiveInYourHousehold.rawValue: self.howManyUsuallyLiveInYourHousehold,
            CodingKeys.householdOwnership.rawValue: self.householdOwnership,
            CodingKeys.hasChildren.rawValue: self.hasChildren,
            CodingKeys.additionalDependents.rawValue: self.additionalDependents,
            CodingKeys.numberOfChildren.rawValue: self.numberOfChildren,
            CodingKeys.unixTimeStamp.rawValue: Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
    }

}
