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

public struct HATApplicationsRolesGranted: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `role` in JSON is `role`
     * `detail` in JSON is `detail`
     */
    private enum CodingKeys: String, CodingKey {
        
        case role
        case detail
    }
    
    // MARK: - Variables

    /// The permission role, read, write etc
    public var role: String = ""
    /// A short explanation for the role. Optional
    public var detail: String?
}
