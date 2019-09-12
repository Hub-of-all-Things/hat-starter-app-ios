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

import Alamofire

// MARK: Struct

public struct HATLogEventService {
    
    // MARK: - Log event

    /**
     Logs a desired event to HAT
     
     - parameter userDomain: User's domain address
     - parameter userToken: User's token
     - parameter logEvent: The even we want to log
     */
    public static func logEvent(userDomain: String, userToken: String, logEvent: HATLogEvent) {
        
        guard let url: URL = URL(string: "https://\(userDomain)/api/v2.6/report-frontend-action") else { return }
        
        do {
            
            let data: Data = try JSONEncoder().encode(logEvent)
            var urlRequest = URLRequest.init(url: url)
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            urlRequest.addValue(userToken, forHTTPHeaderField: "x-auth-token")
            urlRequest.networkServiceType = .background
            urlRequest.httpBody = data
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                
                urlRequest.setValue(ContentType.json, forHTTPHeaderField: "Content-Type")
            }
            
            let configuration: URLSessionConfiguration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
            let manager = Alamofire.SessionManager(configuration: configuration)
            
            manager
                .request(urlRequest)
                .responseJSON { _ in }
                .session.finishTasksAndInvalidate()
        } catch {
            
        }
    }
}
