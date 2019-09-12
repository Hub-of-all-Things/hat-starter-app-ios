/**
 * Copyright (C) 2017-2019 Dataswift Ltd
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
import SystemConfiguration
import SwiftyJSON

// MARK: Enum State

enum State {
    
    case offline
    case online
    case unknown
    case downloading
    case uploading
}

// MARK: - CLass

internal class NetworkManager: NSObject {
    
    // MARK: - Variables
    
    var state: State = .unknown
    
    // MARK: - Check state
    
    /**
     Checks if the phone has internet connectivity or not
     
     - parameter onlineCompletion: A function to execute if the app is online
     - parameter offlineCompletion: A function to execute if the app is offline
     */
    func checkState(onlineCompletion: (() -> Void)? = nil, offlineCompletion: (() -> Void)? = nil) {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            
            self.state = .offline
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        if (isReachable && !needsConnection) {
            
            self.state = .online
            onlineCompletion?()
        } else {
            
            self.state = .offline
            offlineCompletion?()
        }
    }
    
    // MARK: - Initialise
    
    override init() {
        
        super.init()
        
        self.checkState()
    }
    
    // MARK: - Special HAT App specific wrappers

    /**
     <#Function Details#>
     
     - parameter <#Parameter#>: <#Parameter description#>
     - parameter <#Parameter#>: <#Parameter description#>
     - parameter <#Parameter#>: <#Parameter description#>
     - parameter <#Parameter#>: <#Parameter description#>
     
     - returns: <#Returns#>
     */
    class func checkIfEmailExistsForLogin(_ email: String, isHatInSandbox: Bool, completionHandler: @escaping ([String: Any]) -> Void, failHandler: @escaping ([String: Any]) -> Void) {
        
        let url = CheckDatabaseUrls.validateEmail(email: email, isSandbox: isHatInSandbox).addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "+@ ").inverted)
        var urlRequest = URLRequest.init(url: URL(string: url ?? "")!)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.networkServiceType = .background

        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(configuration: configuration)
        
        manager.request(urlRequest).responseJSON(completionHandler: { response in
            
            switch response.result {
                
            case .failure(_):
                
                failHandler(["error": "Request returned error"])
            case .success(let result):
                
                if response.response?.statusCode == 200 {
                    
                    completionHandler(JSON(result).dictionaryObject!)
                } else {
                    
                    failHandler(JSON(result).dictionaryObject!)
                }
            }
        }).session.finishTasksAndInvalidate()
    }
    
    /**
     <#Function Details#>
     
     - parameter <#Parameter#>: <#Parameter description#>
     - parameter <#Parameter#>: <#Parameter description#>
     - parameter <#Parameter#>: <#Parameter description#>
     - parameter <#Parameter#>: <#Parameter description#>
     
     - returns: <#Returns#>
     */
    class func checkIfHatDomainExistsForLogin(_ username: String, isHatInSandbox: Bool, completionHandler: @escaping ([String: Any]) -> Void, failHandler: @escaping ([String: Any]) -> Void) {
        
        var urlRequest = URLRequest.init(url: URL(string: CheckDatabaseUrls.validateUrl(domain: username, isSandbox: isHatInSandbox))!)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.networkServiceType = .background
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.request(urlRequest).responseJSON(completionHandler: { response in
            
            switch response.result {
                
            case .failure(_):
                
                failHandler(["error": "Request returned error"])
            case .success(let result):
                
                if response.response?.statusCode == 200 {
                    
                    completionHandler(JSON(result).dictionaryObject!)
                } else {
                    
                    failHandler(JSON(result).dictionaryObject!)
                }
            }
        }).session.finishTasksAndInvalidate()
    }
}
