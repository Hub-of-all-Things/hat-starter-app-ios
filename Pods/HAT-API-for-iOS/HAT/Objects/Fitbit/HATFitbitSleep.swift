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

public struct HATFitbitSleep: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `type` in JSON is `type`
     * `logID` in JSON is `logId`
     * `levels` in JSON is `levels`
     * `endTime` in JSON is `endTime`
     * `duration` in JSON is `duration`
     * `infoCode` in JSON is `infoCode`
     * `timeInBed` in JSON is `timeInBed`
     * `efficiency` in JSON is `efficiency`
     * `dateOfSleep` in JSON is `dateOfSleep`
     * `minutesAwake` in JSON is `minutesAwake`
     * `minutesAsleep` in JSON is `minutesAsleep`
     * `minutesAfterWakeup` in JSON is `minutesAfterWakeup`
     * `minutesToFallAsleep` in JSON is `minutesToFallAsleep`
     */
    private enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case logID = "logId"
        case levels = "levels"
        case endTime = "endTime"
        case duration = "duration"
        case infoCode = "infoCode"
        case startTime = "startTime"
        case timeInBed = "timeInBed"
        case efficiency = "efficiency"
        case dateOfSleep = "dateOfSleep"
        case minutesAwake = "minutesAwake"
        case minutesAsleep = "minutesAsleep"
        case minutesAfterWakeup = "minutesAfterWakeup"
        case minutesToFallAsleep = "minutesToFallAsleep"
    }
    
    // MARK: - Variables

    /// The type of sleep
    public var type: String = ""
    /// The log ID of sleep
    public var logID: Int = 0
    /// The different levels of sleep (asleep, awake, restless)
    public var levels: HATFitbitSleepLevels = HATFitbitSleepLevels()
    /// The end time of sleep in ISO format
    public var endTime: String = ""
    /// The duration of sleep in milliseconds
    public var duration: Int = 0
    /// The info code of sleep
    public var infoCode: Int = 0
    /// The start time of sleep in ISO format
    public var startTime: String = ""
    /// The time in bed in minutes
    public var timeInBed: Int = 0
    /// The efficiency of sleep
    public var efficiency: Int = 0
    /// The date of sleep in yyyy-MM-dd format
    public var dateOfSleep: String = ""
    /// The minutes awake during sleep
    public var minutesAwake: Int = 0
    /// The minutes asleep during sleep
    public var minutesAsleep: Int = 0
    /// The minutes passed after wake up
    public var minutesAfterWakeup: Int = 0
    /// The minutes passed to fall asleep
    public var minutesToFallAsleep: Int = 0
}
