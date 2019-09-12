/**
 * Copyright (C) 2019 Dataswift Ltd
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

struct HatCreationErrorConstants {
    
    // MARK: - Variables
    
    static let errorMessages: [String: String] = [
        "lengthError": "The name must be between 4 to 21 characters.",
        "uppercaseError": "The name cannot contain uppercase letters.",
        "specialCharsError": "The name cannot contain special characters. (eg.  - _ # % /)",
        "mustStartWithLetterError": "The name must start with a letter.",
        "genericError": "The format of the name is incorrect.",
        "hatNotValid": "General error."
    ]
}
