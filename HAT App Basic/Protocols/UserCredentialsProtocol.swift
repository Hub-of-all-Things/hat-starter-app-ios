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

import HAT_API_for_iOS

// MARK: Protocol

/// provides the token and username of the user easily
internal protocol UserCredentialsProtocol {
    
    // MARK: - Protocol's variables
    
    /// User's domain
    var userDomain: String {
        
        get
    }
    
    /// User's token
    var userToken: String {
        
        get
    }
    
    /// User's email
    var userEmail: String {
        
        get
    }
}

// MARK: - Extension

extension UserCredentialsProtocol {
    
    // MARK: - Implement protocol's variables
    
    var userToken: String {
        
        return HATAccountService.getUsersTokenFromKeychain()
    }
    
    var userDomain: String {
        
        return HATAccountService.theUserHATDomain()
    }
    
    var userEmail: String {
        
        return HATAccountService.theUserEmail()
    }
}

