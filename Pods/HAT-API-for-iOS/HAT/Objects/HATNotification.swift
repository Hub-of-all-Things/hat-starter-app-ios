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

public struct HATNotification {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `notice` in JSON is `notice`
     * `received` in JSON is `received`
     * `read` in JSON is `read`
     */
    private enum CodingKeys: String, CodingKey {
        
        case notice
        case received
        case read
    }
    
    // MARK: - Variables
    
    /// The notification data
    public var notice: HATNotificationNotice = HATNotificationNotice()
    /// The date the notification was created
    public var received: Date = Date()
    /// The date the notification was read. Optional
    public var read: Date?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        notice = HATNotificationNotice()
        received = Date()
        read = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received from the HAT
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempNotice: [String: JSON] = dictionary[CodingKeys.notice.rawValue]?.dictionary {
            
            notice = HATNotificationNotice(dictionary: tempNotice)
        }
        
        if let tempReceivedDate: Int = dictionary[CodingKeys.received.rawValue]?.intValue {
            
            received = Date(timeIntervalSince1970: TimeInterval(tempReceivedDate / 1000))
        }
        
        if let tempReadDate: Int = dictionary[CodingKeys.read.rawValue]?.intValue {
            
            read = Date(timeIntervalSince1970: TimeInterval(tempReadDate / 1000))
        }
    }
    
}
