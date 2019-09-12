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

public struct HATToolsGraphics: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `logo` in JSON is `logo`
     * `screenshots` in JSON is `screenshots`
     */
    private enum CodingKeys: String, CodingKey {
        
        case logo
        case screenshots
    }
    
    // MARK: - Variables

    /// The URL in different sizes to fetch the logo of the tool
    public var logo: HATApplicationsImage = HATApplicationsImage()
    /// An array of URLs in different sized used for the screenshots
    public var screenshots: [HATApplicationsImage] = []
}
