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

public struct HATGoogleCalendarConferenceData: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `conferenceId` in JSON is `conferenceId`
     * `conferenceSolution` in JSON is `conferenceSolution`
     * `entryPoints` in JSON is `entryPoints`
     * `signature` in JSON is `signature`
     * `createRequest` in JSON is `createRequest`
     */
    private enum CodingKeys: String, CodingKey {
        
        case conferenceID = "conferenceId"
        case conferenceSolution = "conferenceSolution"
        case entryPoints = "entryPoints"
        case signature = "signature"
        case createRequest = "createRequest"
    }
    
    // MARK: - Variables
    
    /// The ID of the conference.
    /// Can be used by developers to keep track of conferences, should not be displayed to users.
    ///
    /// Values for solution types:
    ///
    /// - `eventHangout`: unset
    /// - `eventNamedHagout`: the name of the Hangout.
    /// - `hangoutsMeet`: the 10-letter meeting code, for example **"aaa-bbbb-ccc"**.
    /// Optional.
    public var conferenceID: String?
    /// The conference solution, such as Hangouts or Hangouts Meet.
    /// Unset for a conference with failed create request. Optional
    ///
    /// Either **conferenceSolution** and at least one **entryPoint**, or **createRequest** is required.
    public var conferenceSolution: HATGoogleCalendarConferenceSolution?
    /// Information about individual conference entry points, such as URLs or phone numbers.
    /// All of them must belong to the same conference. Optional
    ///
    /// Either **conferenceSolution** and at least one **entryPoint**, or **createRequest** is required.
    public var entryPoints: HATGoogleCalendarEntryPoints?
    /// The signature of the conference data. Optional
    /// Genereated on server side. Must be preserved while copying the conference data between events, otherwise the conference data will not be copied.
    ///
    /// Unset for a conference with failed create request.
    ///
    /// Optional for a conference with a pending create request.
    public var signature: String?
    /// A request to generate a new conference and attach it to the event. The data is generated asynchronously. To see whether the data is present check the status field. Optional
    /// Either **conferenceSolution** and at least one **entryPoint**, or **createRequest** is required.
    public var createRequest: HATGoogleCalendarCreateRequest?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
