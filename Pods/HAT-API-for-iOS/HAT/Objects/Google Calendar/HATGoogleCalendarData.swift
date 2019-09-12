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

public struct HATGoogleCalendarData: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `kind` in JSON is `additionalGuests`
     * `etag` in JSON is `etag`
     * `eventID` in JSON is `id`
     * `status` in JSON is `status`
     * `url` in JSON is `htmlLink`
     * `createdDate` in JSON is `created`
     * `updatedDate` in JSON is `updated`
     * `title` in JSON is `summary`
     * `description` in JSON is `description`
     * `location` in JSON is `location`
     * `colorId` in JSON is `colorId`
     * `creator` in JSON is `creator`
     * `organizer` in JSON is `organizer`
     * `start` in JSON is `start`
     * `end` in JSON is `end`
     * `isEndTimeUnspecified` in JSON is `endTimeUnspecified`
     * `recurrence` in JSON is `recurrence`
     * `recurringEventID` in JSON is `recurringEventId`
     * `originalStartTime` in JSON is `originalStartTime`
     * `transparency` in JSON is `transparency`
     * `visibility` in JSON is `visibility`
     * `iCalUID` in JSON is `iCalUID`
     * `sequence` in JSON is `sequence`
     * `attendees` in JSON is `attendees`
     * `haveAttendeesBeenOmitted` in JSON is `attendeesOmitted`
     * `extendedProperties` in JSON is `extendedProperties`
     * `hangoutURL` in JSON is `hangoutLink`
     * `conferenceData` in JSON is `conferenceData`
     * `gadget` in JSON is `gadget`
     * `canAnyoneAddSelf` in JSON is `anyoneCanAddSelf`
     * `canGuestsInviteOthers` in JSON is `guestsCanInviteOthers`
     * `canGuestsModify` in JSON is `guestsCanModify`
     * `canGuestsSeeOtherGuests` in JSON is `guestsCanSeeOtherGuests`
     * `isPrivateCopy` in JSON is `privateCopy`
     * `isLocked` in JSON is `locked`
     * `reminders` in JSON is `reminders`
     * `source` in JSON is `source`
     * `attachments` in JSON is `attachments`
     */
    private enum CodingKeys: String, CodingKey {
        
        case kind = "kind"
        case etag = "etag"
        case eventID = "id"
        case status = "status"
        case url = "htmlLink"
        case createdDate = "created"
        case updatedDate = "updated"
        case title = "summary"
        case description = "description"
        case location = "location"
        case colorId = "colorId"
        case creator = "creator"
        case organizer = "organizer"
        case start = "start"
        case end = "end"
        case isEndTimeUnspecified = "endTimeUnspecified"
        case recurrence = "recurrence"
        case recurringEventID = "recurringEventId"
        case originalStartTime = "originalStartTime"
        case transparency = "transparency"
        case visibility = "visibility"
        case iCalUID = "iCalUID"
        case sequence = "sequence"
        case attendees = "attendees"
        case haveAttendeesBeenOmitted = "attendeesOmitted"
        case extendedProperties = "extendedProperties"
        case hangoutURL = "hangoutLink"
        case conferenceData = "conferenceData"
        case gadget = "gadget"
        case canAnyoneAddSelf = "anyoneCanAddSelf"
        case canGuestsInviteOthers = "guestsCanInviteOthers"
        case canGuestsModify = "guestsCanModify"
        case canGuestsSeeOtherGuests = "guestsCanSeeOtherGuests"
        case isPrivateCopy = "privateCopy"
        case isLocked = "locked"
        case reminders = "reminders"
        case source = "source"
        case attachments = "attachments"
    }

    // MARK: - Variables
    
    /// The kind of the event, default is "calendar#event"
    public var kind: String = ""
    /// ETag of the resource, eg. \"2936510004024000\"
    public var etag: String = ""
    /// The id of the calendar event
    public var eventID: String = ""
    /// Status of the event. Optional. Possible values are:
    /// - `confirmed` - The event is confirmed. This is the default status.
    /// - `tentative` - The event is tentatively confirmed.
    /// - `cancelled` - The event is cancelled.
    public var status: String?
    /// An absolute link to this event in the Google Calendar Web UI.
    public var url: String = ""
    /// Date the event created in ISO format
    public var createdDate: String = ""
    /// Date the event updated in ISO format
    public var updatedDate: String = ""
    /// The title of the event
    public var title: String = ""
    /// The description of the event. Optional
    public var description: String?
    /// Geographic location of the event as free-form text. Optional
    public var location: String?
    /// The color of the event. This is an ID referring to an entry in the event section of the colors definition [see the colors endpoint](https://developers.google.com/google-apps/calendar/v3/reference/colors) Optional
    public var colorId: String?
    /// The creator of the event
    public var creator: HATGoogleCalendarCreator = HATGoogleCalendarCreator()
    ///The organizer of the event. If the organizer is also an attendee, this is indicated with a separate entry in attendees with the organizer field set to True. To change the organizer, use the [move](https://developers.google.com/google-apps/calendar/v3/reference/events/move) operation. Read-only, except when importing an event.
    public var organizer: HATGoogleCalendarCreator = HATGoogleCalendarCreator()
    /// The (inclusive) start time of the event. For a recurring event, this is the start time of the first instance.
    public var start: HATGoogleCalendarDate = HATGoogleCalendarDate()
    /// The (exclusive) end time of the event. For a recurring event, this is the end time of the first instance.
    public var end: HATGoogleCalendarDate = HATGoogleCalendarDate()
    /// Whether the end time is actually unspecified. An end time is still provided for compatibility reasons, even if this attribute is set to True. The default is False.
    public var isEndTimeUnspecified: Bool?
    /// List of `RRULE`, `EXRULE`, `RDATE` and `EXDATE` lines for a recurring event, as specified in `RFC5545`. Note that `DTSTART` and `DTEND` lines are not allowed in this field; event start and end times are specified in the start and end fields. This field is omitted for single events or instances of recurring events. Optional
    public var recurrence: [String]?
    /// For an instance of a recurring event, this is the id of the recurring event to which this instance belongs. Immutable. Optional
    public var recurringEventID: String?
    /// For an instance of a recurring event, this is the time at which this event would start according to the recurrence data in the recurring event identified by recurringEventId. Immutable. Optional
    public var originalStartTime: HATGoogleCalendarDate?
    /// Whether the event blocks time on the calendar. Optional. Possible values are:
    /// - `opaque` - Default value. The event does block time on the calendar. This is equivalent to setting Show me as to Busy in the Calendar UI.
    /// - `transparent` - The event does not block time on the calendar. This is equivalent to setting Show me as to Available in the Calendar UI.
    public var transparency: String?
    /// Visibility of the event. Optional. Possible values are:
    /// - `default` - Uses the default visibility for events on the calendar. This is the default value.
    /// - `public` - The event is public and event details are visible to all readers of the calendar.
    /// - `private` - The event is private and only event attendees may view event details.
    /// - confidential` - The event is private. This value is provided for compatibility reasons.
    public var visibility: String?
    /// Event unique identifier as defined in RFC5545. It is used to uniquely identify events accross calendaring systems and must be supplied when importing events via the [import](https://developers.google.com/google-apps/calendar/v3/reference/events/import) method.
    /// Note that the icalUID and the id are not identical and only one of them should be supplied at event creation time. One difference in their semantics is that in recurring events, all occurrences of one event have different ids while they all share the same icalUIDs.
    public var iCalUID: String = ""
    /// Sequence number as per iCalendar.
    public var sequence: Int = 0
    /// The attendees of the event. See the [Events with attendees](https://developers.google.com/google-apps/calendar/concepts/#events_with_attendees) guide for more information on scheduling events with other calendar users. Optional
    public var attendees: [HATGoogleCalendarAttendees]?
    /// Whether attendees may have been omitted from the event's representation. When retrieving an event, this may be due to a restriction specified by the **maxAttendee** query parameter. When updating an event, this can be used to only update the participant's response. Optional. The default is False.
    public var haveAttendeesBeenOmitted: Bool?
    /// Extended properties of the event. Optional
    public var extendedProperties: HATGoogleCalendarProperties?
    /// An absolute link to the Google+ hangout associated with this event. Read-only. Optional
    public var hangoutURL: String?
    /// The conference-related information, such as details of a Hangouts Meet conference. To create new conference details use the **createRequest** field. To persist your changes, remember to set the **conferenceDataVersion** request parameter to **1<\code> for all event modification requests.** Optional
    public var conferenceData: HATGoogleCalendarConferenceData?
    /// A gadget that extends this event. Optional
    public var gadget: HATGoogleCalendarGadget?
    /// Whether anyone can invite themselves to the event (currently works for Google+ events only). Optional. The default is False.
    public var canAnyoneAddSelf: Bool?
    /// Whether attendees other than the organizer can invite others to the event. Optional. The default is True.
    public var canGuestsInviteOthers: Bool?
    /// Whether attendees other than the organizer can modify the event. Optional. The default is False.
    public var canGuestsModify: Bool?
    /// Whether attendees other than the organizer can see who the event's attendees are. Optional. The default is True.
    public var canGuestsSeeOtherGuests: Bool?
    /// Whether this is a private event copy where changes are not shared with other copies on other calendars. Optional. Immutable. The default is False.
    public var isPrivateCopy: Bool?
    /// Whether this is a locked event copy where no changes can be made to the main event fields `summary`, `description`, `location`, `start`, `end` or `recurrence`. The default is False. Read-Only. Optional
    public var isLocked: Bool?
    /// Information about the event's reminders for the authenticated user. Optional
    public var reminders: HATGoogleCalendarReminders?
    /// Source from which the event was created. For example, a web page, an email message or any document identifiable by an URL with HTTP or HTTPS scheme. Can only be seen or modified by the creator of the event. Optional
    public var source: HATGoogleCalendarSource?
    /// File attachments for the event. Currently only Google Drive attachments are supported.
    /// In order to modify attachments the **supportsAttachments** request parameter should be set to **true**.
    ///
    /// There can be at most 25 attachments per event. Optional
    public var attachments: [HATGoogleCalendarAttachments]?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
