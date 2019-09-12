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

public struct HATFitbitDailyActivity: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `totalSteps` in JSON is `steps`
     * `dateCreated` in JSON is `dateCreated`
     * `floorsClimbed` in JSON is `floors`
     * `distancesCovered` in JSON is `distances`
     * `elevationGain` in JSON is `elevation`
     * `activeScore` in JSON is `activeScore`
     * `caloriesBMR` in JSON is `caloriesBMR`
     * `caloriesOut` in JSON is `caloriesOut`
     * `activityCalories` in JSON is `activityCalories`
     * `marginalCalories` in JSON is `marginalCalories`
     * `sedentaryMinutes` in JSON is `sedentaryMinutes`
     * `veryActiveMinutes` in JSON is `veryActiveMinutes`
     * `fairlyActiveMinutes` in JSON is `fairlyActiveMinutes`
     * `lightlyActiveMinutes` in JSON is `lightlyActiveMinutes`
     */
    private enum CodingKeys: String, CodingKey {
        
        case totalSteps = "steps"
        case dateCreated = "dateCreated"
        case floorsClimbed = "floors"
        case distancesCovered = "distances"
        case elevationGain = "elevation"
        case activeScore = "activeScore"
        case caloriesBMR = "caloriesBMR"
        case caloriesBurnGoal = "caloriesOut"
        case activityCalories = "activityCalories"
        case marginalCalories = "marginalCalories"
        case sedentaryMinutes = "sedentaryMinutes"
        case veryActiveMinutes = "veryActiveMinutes"
        case fairlyActiveMinutes = "fairlyActiveMinutes"
        case lightlyActiveMinutes = "lightlyActiveMinutes"
    }
    
    // MARK: - Variables
    
    /// The total daily steps taken
    public var totalSteps: Int = 0
    /// The date the activity was created in unix time stamp. Optional
    public var dateCreated: Int?
    /// the total daily floors climbed. Optional
    public var floorsClimbed: Int?
    /// The daily distances covered with the various different activity types
    public var distancesCovered: [HATFitbitActivityDistance] = []
    /// The total daily elevation gain. Optional
    public var elevationGain: Int?
    /// The daily active score
    public var activeScore: Int = 0
    /// The daily BMR, *Basal metabolic rate*, calories
    public var caloriesBMR: Int = 0
    /// The daily burnt calories goal, set by the user usually
    public var caloriesBurnGoal: Int = 0
    /// The daily activity calories. *The number of calories burned during the day for periods of time when the user was active above sedentary level*
    public var activityCalories: Int = 0
    /// The daily marginal calories
    public var marginalCalories: Int = 0
    /// The daily sedentary minutes
    public var sedentaryMinutes: Int = 0
    /// The daily very active minutes
    public var veryActiveMinutes: Int = 0
    /// The daily fairly active minutes
    public var fairlyActiveMinutes: Int = 0
    /// The daily lighly active minutes
    public var lightlyActiveMinutes: Int = 0
}
