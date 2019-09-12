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

import JWTDecode

// MARK: Enum

public enum HATTokenHelper {
    
    // MARK: - Check token scope
    
    /**
     Checks if the token has owner scope and returns it, else returns nil
     
     - parameter token: The token to check for the scope
     - parameter applicationName: The application name to verify against to. This has to match the application that requested the token
     
     - returns: Returns the token if the scope of it is owner else nil
     */
    public static func checkTokenScope(token: String?, applicationName: String) -> String? {
        
        guard let unwrappedToken: String = token else { return nil }
            
        do {
            
            let jwt: JWT = try decode(jwt: unwrappedToken)
            let scope: Claim = jwt.claim(name: HATTokenConstants.accessScope)
            let applications: Claim = jwt.claim(name: HATTokenConstants.application)
            
            if applications.string == applicationName || scope.string == HATTokenConstants.owner {
                
                return unwrappedToken
            }
        } catch {
        }
        
        return nil
    }
    
}
