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

public struct HATFileUploadPermissions {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `userID` in JSON is `userID`
     * `contentReadable` in JSON is `contentReadable`
     */
    private enum CodingKeys: String, CodingKey {
        
        case userID
        case contentReadable
    }

    // MARK: - Variables

    /// The user id that uploaded the file
    public var userID: String = ""
    /// Is the content readable
    public var contentReadable: String = ""

    // MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        userID = ""
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public init(from dict: Dictionary<String, JSON>) {

        self.init()

        if let tempUserID: String = dict["userID"]?.stringValue {

            userID = tempUserID
        }
        if let tempContentReadable: String = dict["contentReadable"]?.stringValue {

            contentReadable = tempContentReadable
        }
    }

    // MARK: - JSON Mapper

    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {

        return [

            "userID": self.userID,
            "contentReadable": self.contentReadable,
            "unixTimeStamp": Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]

    }
}
