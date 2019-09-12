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

public struct HATNotificationNotice {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `noticeID` in JSON is `id`
     * `dateCreated` in JSON is `dateCreated`
     * `message` in JSON is `message`
     */
    private enum CodingKeys: String, CodingKey {
        
        case noticeID = "id"
        case dateCreated = "dateCreated"
        case message = "message"
    }
    
    // MARK: - Variables
    
    /// The notification ID
    public var noticeID: Int = -1
    /// The message of the notification
    public var message: String = ""
    /// The date the notification was created
    public var dateCreated: Date = Date()
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        noticeID = -1
        message = ""
        dateCreated = Date()
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received from the HAT
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempNoticeID: Int = dictionary[CodingKeys.noticeID.rawValue]?.int {
            
            noticeID = tempNoticeID
        }
        
        if let tempMessage: String = dictionary[CodingKeys.message.rawValue]?.string {
            
            message = tempMessage
        }
        
        if let tempDateCreated: Int = dictionary[CodingKeys.dateCreated.rawValue]?.intValue {
            
            dateCreated = Date(timeIntervalSince1970: TimeInterval(tempDateCreated / 1000))
        }
    }
}
