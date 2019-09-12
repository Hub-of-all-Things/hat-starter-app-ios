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

public struct HATFitbitProfile: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `age` in JSON is `age`
     * `imageProfileURL` in JSON is `avatar`
     * `gender` in JSON is `gender`
     * `height` in JSON is `height`
     * `locale` in JSON is `locale`
     * `weight` in JSON is `weight`
     * `features` in JSON is `features`
     * `fullName` in JSON is `fullName`
     * `lastName` in JSON is `lastName`
     * `swimUnit` in JSON is `swimUnit`
     * `timezone` in JSON is `timezone`
     * `imageProfile150URL` in JSON is `avatar150`
     * `imageProfile640URL` in JSON is `avatar640`
     * `corporate` in JSON is `corporate`
     * `encodedId` in JSON is `encodedId`
     * `firstName` in JSON is `firstName`
     * `dateCreated` in JSON is `dateCreated`
     * `topBadges` in JSON is `topBadges`
     * `ambassador` in JSON is `ambassador`
     * `heightUnit` in JSON is `heightUnit`
     * `mfaEnabled` in JSON is `mfaEnabled`
     * `weightUnit` in JSON is `weightUnit`
     * `dateOfBirth` in JSON is `dateOfBirth`
     * `displayName` in JSON is `displayName`
     * `glucoseUnit` in JSON is `glucoseUnit`
     * `memberSince` in JSON is `memberSince`
     * `distanceUnit` in JSON is `distanceUnit`
     * `corporateAdmin` in JSON is `corporateAdmin`
     * `startDayOfWeek` in JSON is `startDayOfWeek`
     * `averageDailySteps` in JSON is `averageDailySteps`
     * `displayNameSetting` in JSON is `displayNameSetting`
     * `offsetFromUTCMillis` in JSON is `offsetFromUTCMillis`
     * `strideLengthRunning` in JSON is `strideLengthRunning`
     * `strideLengthWalking` in JSON is `strideLengthWalking`
     */
    private enum CodingKeys: String, CodingKey {
        
        case age = "age"
        case imageProfileURL = "avatar"
        case gender = "gender"
        case height = "height"
        case locale = "locale"
        case weight = "weight"
        case features = "features"
        case fullName = "fullName"
        case lastName = "lastName"
        case swimUnit = "swimUnit"
        case timezone = "timezone"
        case imageProfile150URL = "avatar150"
        case imageProfile640URL = "avatar640"
        case isCorporate = "corporate"
        case encodedID = "encodedId"
        case firstName = "firstName"
        case dateCreated = "dateCreated"
        case topBadges = "topBadges"
        case isAmbassador = "ambassador"
        case heightUnit = "heightUnit"
        case isMfaEnabled = "mfaEnabled"
        case weightUnit = "weightUnit"
        case dateOfBirth = "dateOfBirth"
        case displayName = "displayName"
        case glucoseUnit = "glucoseUnit"
        case memberSince = "memberSince"
        case distanceUnit = "distanceUnit"
        case isCorporateAdmin = "corporateAdmin"
        case startDayOfWeek = "startDayOfWeek"
        case averageDailySteps = "averageDailySteps"
        case displayNameSetting = "displayNameSetting"
        case offsetFromUTCMillis = "offsetFromUTCMillis"
        case strideLengthRunning = "strideLengthRunning"
        case strideLengthWalking = "strideLengthWalking"
    }
    
    // MARK: - Variables

    /// The user's age
    public var age: Int = 0
    /// The avatar image url of the user
    public var imageProfileURL: String = ""
    /// The user's gender
    public var gender: String = ""
    /// The user's height. This is just a number. The height unit is `heightUnit` variable
    public var height: Int = 0
    /// The user's locale. This is updated automatically from fitbit
    public var locale: String = ""
    /// The user's weight. This is just a number. The weight unit is `weightUnit` variable
    public var weight: Float = 0
    /// The user's features. In here you can find if user has set a goal
    public var features: HATFitbitProfileFeatures = HATFitbitProfileFeatures()
    /// The user's full name
    public var fullName: String = ""
    /// The user's last name
    public var lastName: String = ""
    /// The user's swim distance unit
    public var swimUnit: String = ""
    /// The user's time zone. This is updated automatically from fitbit
    public var timezone: String = ""
    /// The user's profile image url in 150x150
    public var imageProfile150URL: String = ""
    /// The user's profile image url in 640x640
    public var imageProfile640URL: String = ""
    /// Is profile corporate
    public var isCorporate: Bool = false
    /// The encoded user id
    public var encodedID: String = ""
    /// The user's first name
    public var firstName: String = ""
    /// The date the profile was created. Optional
    public var dateCreated: String?
    /// The user's top badges earned. Something like achievements
    public var topBadges: [HATFitbitTopBadges] = []
    /// Is the user an ambassador
    public var isAmbassador: Bool = false
    /// The user's height unit. Can be cm or inches
    public var heightUnit: String = ""
    /// Is mfa, I assume this stands for multi factor authentication, enabled
    public var isMfaEnabled: Bool = false
    /// The user's weight unit. Can be Kilos or stones or lb.
    public var weightUnit: String = ""
    /// The user's date of birth in an ISO format
    public var dateOfBirth: String = ""
    /// The user's display name
    public var displayName: String = ""
    /// The user's glucose unit. Can be mmol or mg/ml
    public var glucoseUnit: String = ""
    /// The date the user joined Fitbit
    public var memberSince: String = ""
    /// The user's distance unit. Can be Km or Miles
    public var distanceUnit: String = ""
    /// Is profile corporate admin
    public var isCorporateAdmin: Bool = false
    /// The start date of the week
    public var startDayOfWeek: String = ""
    /// The user's average daily steps
    public var averageDailySteps: Int = 0
    /// The user's display name
    public var displayNameSetting: String = ""
    /// The user's offset from UTC in ms
    public var offsetFromUTCMillis: Int = 0
    /// The user's stride length while running
    public var strideLengthRunning: Float = 0
    /// The user's stride length while walking
    public var strideLengthWalking: Float = 0
    /// The user's clock time display format, 12h or 24h
    public var clockTimeDisplayFormat: String = ""
    /// The user's stride length while running type
    public var strideLengthRunningType: String = ""
    /// The user's stride length while walking type
    public var strideLengthWalkingType: String = ""
}
