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

// MARK: Protocol

public protocol HATDataPlugProtocol {
    
    // MARK: - Variables
    
    /// The name of the table that HAT saves data
    static var name: String { get set }
    /// The source name of the plug
    static var source: String { get set }
    
    // MARK: - Functions
    
    /**
     Constructs the `api/status` endpoint for the plug according to the dataplug url returned from the HAT
     
     - parameter dataPlugURL: The plug url returned from HAT
     
     - returns: The `dataPlugURL` parameter appended with `/api/status`
     */
    static func checkStatusURL(dataPlugURL: String) -> String
}

// MARK: - Extension

extension HATDataPlugProtocol {
    
    public static func checkStatusURL(dataPlugURL: String) -> String {
        
        return "\(dataPlugURL)/api/status"
    }
}
