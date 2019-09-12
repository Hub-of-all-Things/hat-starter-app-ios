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

public struct HATDataDebit: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `dataDebitKey` in JSON is `dataDebitKey`
     * `dateCreated` in JSON is `dateCreated`
     * `permissions` in JSON is `permissions`
     * `requestClientName` in JSON is `requestClientName`
     * `requestClientUrl` in JSON is `requestClientUrl`
     * `requestClientLogoUrl` in JSON is `requestClientLogoUrl`
     * `requestDescription` in JSON is `requestDescription`
     * `requestApplicationId` in JSON is `requestApplicationId`
     * `isActive` in JSON is `active`
     * `isAccepted` in JSON is `accepted`
     * `startDate` in JSON is `start`
     * `endDate` in JSON is `end`
     * `activePermissions` in JSON is `permissionsLatest`
     * `latestPermissions` in JSON is `requestApplicationId`
     */
    private enum CodingKeys: String, CodingKey {
        
        case dataDebitKey = "dataDebitKey"
        case dateCreated = "dateCreated"
        case permissions = "permissions"
        case requestClientName = "requestClientName"
        case requestClientUrl = "requestClientUrl"
        case requestClientLogoUrl = "requestClientLogoUrl"
        case requestDescription = "requestDescription"
        case requestApplicationId = "requestApplicationId"
        case isActive = "active"
        case isAccepted = "accepted"
        case startDate = "start"
        case endDate = "end"
        case activePermissions = "permissionsActive"
        case latestPermissions = "permissionsLatest"
    }
    
    // MARK: - Variables
    
    /// The `Data Debit` key, a unique ID
    public var dataDebitKey: String = ""
    /// The date that the `Data Debit` was created
    public var dateCreated: String = ""
    /// The permissions of the `Data Debit`. Like when it was activated, the period, what URLS and fields it can access etc
    public var permissions: [HATDataDebitPermissions] = []
    /// The name of the creator of the `Data Debit`
    public var requestClientName: String = ""
    /// The client URL, possibly a website, of the `Data Debit`
    public var requestClientUrl: String = ""
    /// The image URL, in order to fetch it, of the `Data Debit`
    public var requestClientLogoUrl: String = ""
    /// The description of the `Data Debit`. What it does and why it is useful. Optional
    public var requestDescription: String?
    /// The id of the application, if the `Data Debit` is attached to one. Optional
    public var requestApplicationId: String?
    /// A flag indicating if the `Data Debit` active
    public var isActive: Bool = false
    /// A flag indicating if the `Data Debit` is accepted
    public var isAccepted: Bool = false
    /// The start date of the `Data Debit`. Optional
    public var startDate: String?
    /// The end date of the `Data Debit`. After this date the `Data Debit` will be disabled. Optional
    public var endDate: String?
    /// The latest permissions active. Optional
    public var activePermissions: HATDataDebitPermissions?
    /// The latest permission. Permissions can change over time.
    public var latestPermissions: HATDataDebitPermissions = HATDataDebitPermissions()
}
