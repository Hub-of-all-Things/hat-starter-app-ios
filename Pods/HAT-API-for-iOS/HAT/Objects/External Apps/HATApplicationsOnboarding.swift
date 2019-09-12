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

public struct HATApplicationsOnboarding: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `images` in JSON is `illustration`
     * `title` in JSON is `title`
     * `description` in JSON is `description`
     */
    private enum CodingKeys: String, CodingKey {
        
        case images = "illustration"
        case title = "title"
        case description = "description"
    }
    
    // MARK: - Variables

    /// The image URLs to show
    public var images: HATApplicationsImage = HATApplicationsImage()
    /// The main text to show in each screen. Usually a few words
    public var title: String = ""
    /// A subtitle text to show in each screen. Usually one or two phrases
    public var description: String = ""
}
