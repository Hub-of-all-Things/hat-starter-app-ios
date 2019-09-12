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

public struct HATApplicationsDescription: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `text` in JSON is `text`
     * `markdown` in JSON is `markdown`
     * `html` in JSON is `html`
     */
    private enum CodingKeys: String, CodingKey {
        
        case text
        case markdown
        case html
    }

    // MARK: - Variables
    
    /// The description text as simple String
    public var text: String = ""
    /// The description text markdown formatted. Optional
    public var markdown: String?
    /// The description text html formatted. Optional
    public var html: String?
}
