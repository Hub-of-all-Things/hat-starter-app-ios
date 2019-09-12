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

public struct HATDataDebitCreation: HATObject {
    
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
        case purpose = "purpose"
        case startDate = "start"
        case period = "period"
        case termsUrl = "termsUrl"
        case willCancelAtPeriodsEnd = "cancelAtPeriodEnd"
        case requestClientName = "requestClientName"
        case requestClientUrl = "requestClientUrl"
        case requestClientLogoUrl = "requestClientLogoUrl"
        case requestApplicationId = "requestApplicationId"
        case requestDescription = "requestDescription"
        case conditions = "conditions"
        case bundle = "bundle"
    }
    
    // MARK: - Variables
    
    /// Technically the ID of the `Data Debit`
    public var dataDebitKey: String = ""
    /// A small description, its purpose, why it exists and what it does
    public var purpose: String = ""
    /// The stard date as an ISO format
    public var startDate: String = ""
    /// The duration of the `Data Debit` in seconds
    public var period: Double = 0
    /// The Terms and Conditions URL for the `Data Debit`
    public var termsUrl: String = ""
    /// A flag indicating if the the `Data Debit` will automatically be cancelled at the period's end
    public var willCancelAtPeriodsEnd: Bool = false
    /// The name of the client that created this `Data Debit`
    public var requestClientName: String = ""
    /// A URL, like a website, of the client that created this `Data Debit`
    public var requestClientUrl: String = ""
    /// The logo URL of the client that created this `Data Debit` in order to load the image
    public var requestClientLogoUrl: String = ""
    /// The Application ID, if the `Data Debit` is attached to one. Optional
    public var requestApplicationId: String? = ""
    /// A short description for the `Data Debit`. What this is and why it exists. Optinal, can be nil
    public var requestDescription: String? = ""
    /// Some `Data Debits` can have some conditions attached to them. For example all the search for a `String` or search for a number to be `between` 2 numbers. Optional
    public var conditions: HATDataDefinition?
    /// The bundle attached to this `Data Debit`. The bundle holds info about the urls and the specific fields that it wants access
    public var bundle: HATDataDefinition = HATDataDefinition()
    
    // MARK: - Initializers
    
    /**
     Initializing a `DataDebitCreationObject` from all the non optional values.
     
     - parameter dataDebitKey: The ID of the `Data Debit`
     - parameter purpose: A small description, its purpose, why it exists and what it does
     - parameter start: The stard date as an ISO format
     - parameter period: The duration of the `Data Debit` in seconds
     - parameter termsUrl: The Terms and Conditions URL for the `Data Debit`
     - parameter cancelAtPeriodEnd: A flag indicating if the the `Data Debit` will automatically be cancelled at the period's end
     - parameter requestClientName: The name of the client that created this `Data Debit`
     - parameter requestClientUrl: A URL, like a website, of the client that created this `Data Debit`
     - parameter requestClientLogoUrl: The logo URL of the client that created this `Data Debit` in order to load the image
     - parameter bundle: The bundle attached to this `Data Debit`. The bundle holds info about the urls and the specific fields that it wants access
     */
    public init(dataDebitKey: String, purpose: String, start: String, period: Double, termsUrl: String, cancelAtPeriodEnd: Bool, requestClientName: String, requestClientUrl: String, requestClientLogoUrl: String, bundle: HATDataDefinition) {
        
        self.dataDebitKey = dataDebitKey
        self.purpose = purpose
        self.startDate = start
        self.period = period
        self.termsUrl = termsUrl
        self.willCancelAtPeriodsEnd = cancelAtPeriodEnd
        self.requestClientName = requestClientName
        self.requestClientUrl = requestClientUrl
        self.requestClientLogoUrl = requestClientLogoUrl
        self.bundle = bundle
    }
    
    /**
     Initializing an empty `DataDebitCreationObject`
     */
    public init() {
        
    }
}
