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

public struct HATDataDebitPermissions: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `dateCreated` in JSON is `dateCreated`
     * `purpose` in JSON is `purpose`
     * `startDate` in JSON is `start`
     * `period` in JSON is `period`
     * `endDate` in JSON is `end`
     * `willCancelAtPeriodsEnd` in JSON is `cancelAtPeriodEnd`
     * `termsUrl` in JSON is `termsUrl`
     * `isActive` in JSON is `active`
     * `isAccepted` in JSON is `accepted`
     * `conditions` in JSON is `conditions`
     * `bundle` in JSON is `bundle`
     */
    private enum CodingKeys: String, CodingKey {
        
        case dateCreated = "dateCreated"
        case purpose = "purpose"
        case startDate = "start"
        case period = "period"
        case endDate = "end"
        case willCancelAtPeriodsEnd = "cancelAtPeriodEnd"
        case termsUrl = "termsUrl"
        case isActive = "active"
        case isAccepted = "accepted"
        case conditions = "conditions"
        case bundle = "bundle"
    }

    // MARK: - Variables
    
    /// The created date of the permission
    public var dateCreated: String = ""
    /// The purpose of the permission. A short description of what it offers. Optional
    public var purpose: String?
    /// The start date of the permission in an ISO format. Optional
    public var startDate: String?
    /// The end date of the permission in an ISO format. Optional
    public var endDate: String?
    /// A flag indicating if the permissions will auto cancel when the debit will end
    public var willCancelAtPeriodsEnd: Bool = false
    /// The terms and conditions URL for the permissions. Optional
    public var termsUrl: String?
    /// The period duration. How long the permissions will be active
    public var period: Int = 0
    /// A flag indicating if the permissions are currently active
    public var isActive: Bool = false
    /// A flag indicating if the permissions have been accepted by the user
    public var isAccepted: Bool = false
    /// The bundle. It has all sorts of info about which endpoint and fields it can access. Also about mapping and filtering those fields. It can be nil
    public var bundle: HATDataDefinition = HATDataDefinition()
    /// Some `Data Debits` can have some conditions attached to them. For example all the search for a `String` or search for a number to be `between` 2 numbers. Optional
    public var conditions: HATDataDefinition?
}
