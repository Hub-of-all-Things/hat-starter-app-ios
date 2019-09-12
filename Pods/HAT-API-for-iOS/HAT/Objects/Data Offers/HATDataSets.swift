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

public struct HATDataSets: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `requiredDataDefinitionName` in JSON is `name`
     * `requiredDataDefinitionDescription` in JSON is `description`
     * `requiredDataDefinitionFields` in JSON is `fields`
     */
    private enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case dataSetsDescription = "description"
        case fields = "fields"
    }
    
    // MARK: - Variables
    
    /// the name of the definition
    public var name: String = ""
    /// the description of the definition
    public var dataSetsDescription: String = ""
    
    /// the fields of the definition
    public var fields: [HATDataSetsFields] = []
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        name = ""
        dataSetsDescription = ""
        fields = []
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempName: String = dictionary[HATDataSets.CodingKeys.name.rawValue]?.string {
            
            name = tempName
        }
        
        if let tempDataSetsDescription: String = dictionary[HATDataSets.CodingKeys.dataSetsDescription.rawValue]?.string {
            
            dataSetsDescription = tempDataSetsDescription
        }
        
        if let tempFields: [JSON] = dictionary[HATDataSets.CodingKeys.fields.rawValue]?.array, !tempFields.isEmpty {
            
            for field: JSON in tempFields {
                
                fields.append(HATDataSetsFields(dictionary: field.dictionaryValue))
            }
        }
    }
}
