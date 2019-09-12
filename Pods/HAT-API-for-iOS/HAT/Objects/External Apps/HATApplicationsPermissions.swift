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

public struct HATApplicationsPermissions: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `rolesGranted` in JSON is `rolesGranted`
     * `dataRequired` in JSON is `dataRequired`
     * `dataRetrieved` in JSON is `dataRetrieved`
     */
    private enum CodingKeys: String, CodingKey {
        
        case rolesGranted
        case dataRequired
        case dataRetrieved
    }

    // MARK: - Variables
    
    /// Any roles granted with this app, write/read and an optional explanation
    public var rolesGranted: [HATApplicationsRolesGranted] = []
    /// The data required for the application. Like startDate, endDate and the bundle information. Optional
    public var dataRequired: HATApplicationsDataRequired?
    /// The bundle info required for this app. Where the application has access, what fields, any transformation etc. Optional
    public var dataRetrieved: HATDataDefinition?
}
