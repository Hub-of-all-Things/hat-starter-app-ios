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

public struct HATTools: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `toolID` in JSON is `id`
     * `info` in JSON is `info`
     * `developer` in JSON is `developer`
     * `status` in JSON is `status`
     * `dataBundle` in JSON is `dataBundle`
     * `trigger` in JSON is `trigger`
     */
    private enum CodingKeys: String, CodingKey {
        
        case toolID = "id"
        case info = "info"
        case developer = "developer"
        case status = "status"
        case dataBundle = "dataBundle"
        case trigger = "trigger"
    }
    
    // MARK: - Variables
    
    /// A unique ID for the tool
    public var toolID: String = ""
    /// Info about the tool. Here you can find about the tool version, name, description, release date etc.
    public var info: HATToolsInfo = HATToolsInfo()
    /// Info about the developer of the tool. Here you can find info like the developer's name, email and country
    public var developer: HATApplicationsDeveloper = HATApplicationsDeveloper()
    /// Info about the status of the tool. Here you can find info like if the tool is available, is enabled and when it executed
    public var status: HATToolsStatus = HATToolsStatus()
    /// Info about the data bundle of the tool. Like what endpoints can access what fields etc.
    public var dataBundle: HATToolsDataBundle = HATToolsDataBundle()
    /// Info about the execution rate of the tool. Here you can find how often the tool will be executing
    public var trigger: HATToolsTrigger = HATToolsTrigger()
}
