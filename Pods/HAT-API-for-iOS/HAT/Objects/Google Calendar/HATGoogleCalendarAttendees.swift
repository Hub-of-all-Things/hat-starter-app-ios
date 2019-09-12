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

public struct HATGoogleCalendarAttendees: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `numberOfAdditionalGuests` in JSON is `additionalGuests`
     * `comment` in JSON is `comment`
     * `email` in JSON is `email`
     * `profileID` in JSON is `id`
     * `isAttendeeOptional` in JSON is `optional`
     * `additiisAttendeeOrganizeronalGuests` in JSON is `organizer`
     * `isAttendeeResource` in JSON is `resource`
     * `responseStatus` in JSON is `responseStatus`
     * `isInCurrentCalendar` in JSON is `self`
     */
    private enum CodingKeys: String, CodingKey {
        
        case numberOfAdditionalGuests = "additionalGuests"
        case comment = "comment"
        case displayName = "displayName"
        case email = "email"
        case profileID = "id"
        case isAttendeeOptional = "optional"
        case isAttendeeOrganizer = "organizer"
        case isAttendeeResource = "resource"
        case responseStatus = "responseStatus"
        case isInCurrentCalendar = "self"
    }
    
    // MARK: - Variables
    
    /// Number of additional guests. Optional. The default is 0.
    public var numberOfAdditionalGuests: Int?
    /// The attendee's response comment. Optional.
    public var comment: String?
    /// The attendee's name, if available. Optional.
    public var displayName: String?
    /// The attendee's email address, if available. This field must be present when adding an attendee. It must be a valid email address as per RFC5322.
    public var email: String = ""
    /// The attendee's Profile ID, if available. It corresponds to the *id* field in the [People collection of the Google+ API](https://developers.google.com/+/web/api/rest/latest/people). Optional
    public var profileID: String?
    /// Whether this is an optional attendee. Optional. The default is False. Optional
    public var isAttendeeOptional: Bool?
    /// Whether the attendee is the organizer of the event. Read-only. The default is False. Optional
    public var isAttendeeOrganizer: Bool?
    /// Whether the attendee is a resource. Read-only. The default is False. Optional
    public var isAttendeeResource: Bool?
    /// The attendee's response status.
    ///
    /// Possible values are:
    /// - `needsAction` - The attendee has not responded to the invitation.
    /// - `declined` - The attendee has declined the invitation.
    /// - `tentative` - The attendee has tentatively accepted the invitation.
    /// - `accepted` - The attendee has accepted the invitation.
    public var responseStatus: String = ""
    /// Whether this entry represents the calendar on which this copy of the event appears. Read-only. The default is False. Optional
    public var isInCurrentCalendar: Bool?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
