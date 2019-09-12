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

public struct HATDataOfferClaim: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `claimStatus` in JSON is `status`
     * `isClaimConfirmed` in JSON is `confirmed`
     * `dateCreated` in JSON is `dateCreated`
     * `dataDebitID` in JSON is `dataDebitId`
     */
    private enum CodingKeys: String, CodingKey {
        
        case claimStatus = "status"
        case isClaimConfirmed = "confirmed"
        case dateCreated = "dateCreated"
        case dataDebitID = "dataDebitId"
    }
    
    // MARK: - Variables
    
    /// The data offer claim status. Can be `confirmed`, `claimed` and `completed`
    public var claimStatus: String = ""
    /// A flag indicating if the claim was confirmed
    public var isClaimConfirmed: Bool = false
    /// The date that the offer has been claimed as a unix time stamp
    public var dateCreated: Int = -1
    /// The `Data Debit` id that the offer is attached to
    public var dataDebitID: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        claimStatus = ""
        isClaimConfirmed = false
        dateCreated = -1
        dataDebitID = ""
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempStatus: String = dictionary[HATDataOfferClaim.CodingKeys.claimStatus.rawValue]?.string {
            
            claimStatus = tempStatus
        }
        
        if let tempConfirmed: Bool = dictionary[HATDataOfferClaim.CodingKeys.isClaimConfirmed.rawValue]?.bool {
            
            isClaimConfirmed = tempConfirmed
        }
        
        if let tempDataDebitID: String = dictionary[HATDataOfferClaim.CodingKeys.dataDebitID.rawValue]?.string {
            
            dataDebitID = tempDataDebitID
        }
        
        if let tempDateStamp: Int = dictionary[HATDataOfferClaim.CodingKeys.dateCreated.rawValue]?.int {
            
            dateCreated = tempDateStamp
        }
    }
}
