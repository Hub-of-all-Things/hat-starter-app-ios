//
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

// MARK: Struct

struct AppStatusManager: UserCredentialsProtocol {
    
    // MARK: - Get Cluster
    
    /**
     Gets the current cluster of the app according to if the app is beta or not
     
     - returns: hubat.net if app is beta and hat.direct if not
     */
    static func getCluster() -> String {
        
        return "hubat.net"
    }
    
    // MARK: - Get app name
    
    /**
     Gets the name of the app according to if the app is beta or not
     
     - returns: testhatapp
     */
    static func getAppName() -> String {
        
        return "testhatapp"
    }
    
    // MARK: - Get hatters url
    
    /**
     Gets the hatters url according to if the app is beta or not
     
     - returns: https://hatters.hubofallthings.com
     */
    static func getHattersUrl() -> String {
        
        return "https://hatters.hubofallthings.com"
    }
    
    // MARK: - Check if app needs updating
    
    /**
     Checks if the app needs updating
     */
    static func checkIfAppNeedsUpdating(userDomain: String, userToken: String) {
        
        func getAppInfo() {
            
            HATExternalAppsService.getAppInfo(
                userToken: userToken,
                userDomain: userDomain,
                applicationId: AppStatusManager.getAppName(),
                completion: { application, newToken in
                    
                    AppStatusManager.gotAppInfo(userDomain: userDomain, application: application, newUserToken: newToken)
                },
                failCallBack: { _ in return })
        }
        
        NetworkManager().checkState(
            onlineCompletion: getAppInfo,
            offlineCompletion: nil)
    }
    
    /**
     App info received. Checks if the app needs updating. If yes logs user out.
     
     - parameter application: The testhatapp application
     - parameter newUserToken: The refreshed user's token
     */
    static private func gotAppInfo(userDomain: String, application: HATExternalApplications, newUserToken: String?) {
        
        if application.needsUpdating ?? false {
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                
                appDelegate.coordinator?.logOutUser()
            }
        }
    }
}
