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

public struct HATFileUploadStatus {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `status` in JSON is `status`
     * `size` in JSON is `size`
     */
    private enum CodingKeys: String, CodingKey {
        
        case status
        case size
    }

    // MARK: - Variables

    /// The status of the uploaded file. Can be either `new` or `completed` when the upload file has been marked as completed
    public var status: String = ""
    /// The size of the uploaded file. Optional
    public var size: Int?

    // MARK: - Initialisers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {

        status = ""
        size = nil
    }

    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public init(from dict: Dictionary<String, JSON>) {

        self.init()

        if let tempStatus: String = dict["status"]?.stringValue {

            status = tempStatus
        }
        if let tempSize: Int = dict["size"]?.intValue {

            size = tempSize
        }
    }

    // MARK: - JSON Mapper

    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {

        if size != nil {

            return [

                "status": self.status,
                "size": self.size!,
                "unixTimeStamp": Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
            ]
        }
        
        return [
            
            "status": self.status,
            "unixTimeStamp": Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
    }
}
