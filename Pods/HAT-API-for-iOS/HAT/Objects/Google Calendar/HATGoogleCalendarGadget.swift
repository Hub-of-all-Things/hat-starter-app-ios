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

public struct HATGoogleCalendarGadget: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `display` in JSON is `display`
     * `height` in JSON is `height`
     * `iconLink` in JSON is `iconLink`
     * `link` in JSON is `link`
     * `preferences` in JSON is `preferences`
     * `title` in JSON is `title`
     * `type` in JSON is `type`
     * `width` in JSON is `width`
     */
    private enum CodingKeys: String, CodingKey {
        
        case display = "display"
        case height = "height"
        case iconURL = "iconLink"
        case url = "link"
        case preferences = "preferences"
        case title = "title"
        case type = "type"
        case width = "width"
    }
    
    // MARK: - Variables
    
    /// The gadget's display mode. Optional. Possible values are:
    /// - `icon` - The gadget displays next to the event's title in the calendar view.
    /// - `chip` - The gadget displays when the event is clicked.
    public var display: String?
    /// The gadget's height in pixels. The height must be an integer greater than 0. Optional.
    public var height: Int?
    /// The gadget's icon URL. The URL scheme must be HTTPS.
    public var iconURL: String?
    /// The gadget's URL. The URL scheme must be HTTPS.
    public var url: String?
    /// The preference name and corresponding value.
    public var preferences: [String: String]?
    /// The gadget's title.
    public var title: String?
    /// The gadget's type.
    public var type: String?
    /// The gadget's width in pixels. The width must be an integer greater than 0. Optional.
    public var width: Int?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
