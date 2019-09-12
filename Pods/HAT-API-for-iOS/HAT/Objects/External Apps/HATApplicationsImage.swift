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

public struct HATApplicationsImage: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `small` in JSON is `small`
     * `normal` in JSON is `normal`
     * `large` in JSON is `large`
     * `xLarge` in JSON is `xlarge`
     */
    private enum CodingKeys: String, CodingKey {
        
        case small = "small"
        case normal = "normal"
        case large = "large"
        case xLarge = "xlarge"
    }

    // MARK: - Variables
    
    /// A URL for the small image in resolution. Optional
    public var small: String?
    /// A URL for the normal image in resolution
    public var normal: String = ""
    /// A URL for the large image in resolution. Optional
    public var large: String?
    /// A URL for the extra large image in resolution. Optional
    public var xLarge: String?
}
