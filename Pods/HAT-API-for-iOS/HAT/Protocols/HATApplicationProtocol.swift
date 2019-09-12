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

// MARK: Protocol

public protocol HATApplicationProtocol {
    
    // MARK: - Variables
    
    /// The name of the table that HAT saves data
    static var name: String { get set }
    /// The source name of the application
    static var source: String { get set }
}
