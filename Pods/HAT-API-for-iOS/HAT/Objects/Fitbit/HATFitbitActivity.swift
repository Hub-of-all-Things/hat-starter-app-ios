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

public struct HATFitbitActivity: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `logID` in JSON is `logId`
     * `totalSteps` in JSON is `steps`
     * `logType` in JSON is `logType`
     * `tcxLink` in JSON is `tcxLink`
     * `totalCalories` in JSON is `calories`
     * `activityDuration` in JSON is `duration`
     * `startTime` in JSON is `startTime`
     * `activityName` in JSON is `activityName`
     * `lastModified` in JSON is `lastModified`
     * `elevationGain` in JSON is `elevationGain`
     * `heartRateLink` in JSON is `heartRateLink`
     * `activeDuration` in JSON is `activeDuration`
     * `activityTypeID` in JSON is `activityTypeId`
     * `heartRateZones` in JSON is `heartRateZones`
     * `averageHeartRate` in JSON is `averageHeartRate`
     * `originalDuration` in JSON is `originalDuration`
     * `originalStartTime` in JSON is `originalStartTime`
     * `manualValuesSpecified` in JSON is `manualValuesSpecified`
     */
    private enum CodingKeys: String, CodingKey {
        
        case logID = "logId"
        case totalSteps = "steps"
        case logType = "logType"
        case tcxLink = "tcxLink"
        case totalCalories = "calories"
        case activityDuration = "duration"
        case startTime = "startTime"
        case activityName = "activityName"
        case lastModified = "lastModified"
        case elevationGain = "elevationGain"
        case heartRateLink = "heartRateLink"
        case activeDuration = "activeDuration"
        case activityTypeID = "activityTypeId"
        case heartRateZones = "heartRateZones"
        case averageHeartRate = "averageHeartRate"
        case originalActivityDuration = "originalDuration"
        case originalStartTime = "originalStartTime"
        case manualValues = "manualValuesSpecified"
    }
    
    // MARK: - Variables
    
    /// The log id of the activity
    public var logID: Int = 0
    /// Total steps in the activity. Optional
    public var totalSteps: Int?
    /// The type of the log
    public var logType: String = ""
    /// The tcxlink. The Training Center XML (TCX) is a data exchange format that contains GPS, heart rate, and lap data, when it is available for the activity. The TCX MIME type is `application/vnd.garmin.tcx+xml`. Optional
    public var tcxLink: String?
    /// Total calories burnt during the activity
    public var totalCalories: Int = 0
    // The duration of the activity in ms
    public var activityDuration: Int64 = 0
    /// The start time of the activity in an ISO format
    public var startTime: String = ""
    /// The name of the activity
    public var activityName: String = ""
    /// The date the activity was last modified in ISO format
    public var lastModified: String = ""
    /// The activity level. Here you can find info about the various activity name and duration
    public var activityLevel: [HATFitbitActivityLevel] = []
    /// The elavation gain during the activity
    public var elevationGain: Float?
    /// The heart rate link
    public var heartRateLink: String?
    /// The duration active during the activity
    public var activeDuration: Int = 0
    /// The activity type ID
    public var activityTypeID: Int = 0
    /// The heart rate zones
    public var heartRateZones: [HATFitbitHeartRateZone]?
    /// The average heart rate during the activity
    public var averageHeartRate: Int?
    /// The original duration of the activity
    public var originalActivityDuration: Int = 0
    /// The original start time
    public var originalStartTime: String = ""
    /// The manual specified values
    public var manualValues: HATFitbitManualValues = HATFitbitManualValues()
}
