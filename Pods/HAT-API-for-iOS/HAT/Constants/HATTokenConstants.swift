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

// MARK: Enum

/// Some values to access parts of the token
public enum HATTokenConstants {
    
    // MARK: - Variables

    /// The access scope part of the token. This defines the scope and permissions of the token
    public static let accessScope: String = "accessScope"
    /// The application part of the token. This has to match the application that requested this token
    public static let application: String = "application"
    /// The owner part of the token. Only few apps will be owner apps. This is here mainly for compatibility reasons
    public static let owner: String = "owner"
}
