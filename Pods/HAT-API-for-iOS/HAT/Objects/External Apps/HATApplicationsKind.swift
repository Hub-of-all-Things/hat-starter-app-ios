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

public struct HATApplicationsKind: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `webURL` in JSON is `url`
     * `iosUrl` in JSON is `iosUrl`
     * `kind` in JSON is `kind`
     */
    private enum CodingKeys: String, CodingKey {
        
        case webURL = "url"
        case iosUrl = "iosUrl"
        case kind = "kind"
    }
    
    // MARK: - Variables
    
    /// The web url for the app
    public var webURL: String = ""
    /// The iOS url to launch the app. Optional
    public var iosUrl: String?
    /// The kind of the app, Internal or External app.
    public var kind: String = ""
}
