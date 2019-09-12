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

public struct HATApplicationsGraphics: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `small` in JSON is `small`
     * `normal` in JSON is `normal`
     * `large` in JSON is `large`
     */
    private enum CodingKeys: String, CodingKey {
        
        case banner
        case logo
        case screenshots
    }

    // MARK: - Variables
    
    /// The banner logo
    public var banner: HATApplicationsImage = HATApplicationsImage()
    /// The app logo
    public var logo: HATApplicationsImage = HATApplicationsImage()
    /// The screenshots used in the preview
    public var screenshots: [HATApplicationsImage] = []
}
