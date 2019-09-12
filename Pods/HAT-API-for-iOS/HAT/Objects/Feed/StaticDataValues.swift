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

// MARK: Struct

public struct StaticDataValues: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `name` in JSON is `name`
     * `values` in JSON is `values`
     */
    private enum CodingKeys: String, CodingKey {
        
        case name
        case values
    }
    
    // MARK: - Variables
    
    /// The name of the endpoint that gave the data
    public var name: String = ""
    /// The data that the mapper generated for that endpoint
    public var values: [String: String] = [:]
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
    
    /**
     The default initialiser. Initialises everything to the values passed as parameters.
     
     - parameter name: The name of the endpoint that gave the data
     - parameter values: The data that the mapper generated for that endpoint
     */
    public init(name: String, values: [String: String]) {
        
        self.name = name
        self.values = values
    }
}
