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

public struct HATGoogleCalendarCreateRequest: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `conferenceSolutionKey` in JSON is `conferenceSolutionKey`
     * `requestID` in JSON is `requestId`
     * `status` in JSON is `status`
     */
    private enum CodingKeys: String, CodingKey {
        
        case conferenceSolutionKey = "conferenceSolutionKey"
        case requestID = "requestId"
        case status = "status"
    }
    
    // MARK: - Variables

    /// The conference solution, such as Hangouts or Hangouts Meet. Optional
    public var conferenceSolutionKey: HATGoogleCalendarSolutionKey?
    /// The client-generated unique **ID** for this request.
    /// Clients should regenerate this ID for every new request. If an ID provided is the same as for the previous request, the request is ignored. Optional
    public var requestID: String?
    /// The status of the conference create request. Optional
    public var status: HATGoogleCalendarCreateRequestStatus?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
