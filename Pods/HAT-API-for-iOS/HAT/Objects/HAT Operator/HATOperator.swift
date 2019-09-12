//
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

import Foundation

// MARK: - HATOperator class

/// A type used in `bundles` and `conditions` representing the type of the data debit
public class HATOperator: Codable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `operatorType` in JSON is `operator`
     */
    private enum CodingKeys: String, CodingKey {
        
        case operatorType = "operator"
    }
    
    // MARK: - Operator types
    
    /// The different types of operators you can come across
    /// - Possible types:
    ///     * `operatorFind` can be found as `find` in the JSON file
    ///     * `operatorContains` can be found as `contains` in the JSON file
    ///     * `operatorBetween` can be found as `between` in the JSON file
    ///     * `operatorIn` can be found as `in` in the JSON file
    enum HATOperatorTypes: String, Codable {
        
        case operatorFind = "find"
        case operatorContains = "contains"
        case operatorBetween = "between"
        case operatorIn = "in"
    }
    
    // MARK: - Variables
    
    /// The type of the operator for the specific `dataDebit`
    var operatorType: HATOperatorTypes
    
    // MARK: - Initialiser
    
    /**
     Decodes from a JSON file receiced over the internet to a class
     
     - parameter decoder: The `Decoder` to decode the class from a JSON file to a class
     */
    public required init(from decoder: Decoder) throws {
        
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        self.operatorType = try container.decode(HATOperatorTypes.self, forKey: .operatorType)
    }
}
