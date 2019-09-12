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

public struct HATApplicationsDataRequired: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `isRolling` in JSON is `rolling`
     * `bundle` in JSON is `bundle`
     * `startDate` in JSON is `startDate`
     * `endDate` in JSON is `endDate`
     */
    private enum CodingKeys: String, CodingKey {
        
        case isRolling = "rolling"
        case bundle = "bundle"
        case startDate = "startDate"
        case endDate = "endDate"
    }
    
    // MARK: - Variables
    
    /// A flag indicating if the data will be collected in a rolling scenario
    public var isRolling: Bool = false
    /// The bundle info definition for this app
    public var bundle: HATDataDefinition = HATDataDefinition()
    /// The start date in an ISO format. Optional
    public var startDate: String?
    /// The end date in an ISO format. Optional
    public var endDate: String?
}
