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
import JWTDecode

// MARK: Extension

extension HATLoginService {
    
    // MARK: - Check if token is active
    
    /**
     Checks if token has expired
     
     - parameter token: The token to check if expired
     - parameter expiredCallBack: A function to execute if the token has expired
     - parameter tokenValidCallBack: A function to execute if the token is valid
     - parameter errorCallBack: A function to execute when something has gone wrong
     */
    static func checkIfTokenExpired(token: String, expiredCallBack: () -> Void, tokenValidCallBack: (String?) -> Void, errorCallBack: ((String, String, String, @escaping () -> Void) -> Void)?) {
        
        do {
            
            let jwt: JWT = try decode(jwt: token)
            if jwt.expired {
                
                KeychainManager.setKeychainValue(key: KeychainConstants.Values.expired, value: KeychainConstants.logedIn)
                KeychainManager.clearKeychainKey(key: KeychainConstants.userToken)
                expiredCallBack()
            } else {
                
                tokenValidCallBack(token)
            }
        } catch {
            
            errorCallBack?("Checking token expiry date failed, please log out and log in again", "Error", "OK", {})
        }
    }
}
