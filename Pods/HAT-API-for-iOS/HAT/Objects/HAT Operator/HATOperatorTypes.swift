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

// MARK: OperatorIn class

/// The `in` operator used in `dataDebits`
public class OperatorIn: HATOperator {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `value` in JSON is `value`
     */
    private enum CodingKeys: String, CodingKey {
        
        case value
    }
    
    // MARK: - Variables

    /// value
    var value: Dictionary<String, String> = [:]
}

// MARK: - OperatorContains class

/// The `contains` operator used in `dataDebits` asking for a search in a `String` for a specific `substring`
public class OperatorContains: HATOperator {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `hasValue` in JSON is `value`
     */
    private enum CodingKeys: String, CodingKey {
        
        case hasValue = "value"
    }
    
    // MARK: - Variables

    /// A flag indicating if the specific `dataDebit` contains the required `substring` or not
    var hasValue: Bool = false
}

// MARK: - OperatorBetween class

/// The `between` operator used in `dataDebits` asking for a search in a number between 2 values
public class OperatorBetween: HATOperator {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `upperLimit` in JSON is `upper`
     * `lowerLimit` in JSON is `lower`
     */
    private enum CodingKeys: String, CodingKey {
        
        case upperLimit = "upper"
        case lowerLimit = "lower"
    }
    
    // MARK: - Variables

    /// The upper limit of the search to search for
    var upperLimit: Int = 0
    /// The lower limit of the search to search for
    var lowerLimit: Int = 0
}

// MARK: - OperatorFind class

/// The `find` operator used in `dataDebits` asking for a search in a `String`
public class OperatorFind: HATOperator {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `operatorType` in JSON is `operator`
     * `searchString` in JSON is `search`
     */
    private enum CodingKeys: String, CodingKey {
        
        case operatorType = "operator"
        case searchString = "search"
    }
    
    // MARK: - Variables

    /// The `String` to search for
    var searchString: String = ""
    
    // MARK: - Initialiser

    /**
     Decodes from a JSON file receiced over the internet to a class
     
     - parameter decoder: The `Decoder` to decode the class from a JSON file to a class
     */
    public required init(from decoder: Decoder) throws {
        
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        self.searchString = try container.decode(String.self, forKey: .searchString)
        try super.init(from: decoder)
    }
}
