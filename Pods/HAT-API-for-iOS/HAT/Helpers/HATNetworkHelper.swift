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
import SwiftyJSON

// MARK: struct

/// All network related methods
public struct HATNetworkHelper {
    
    // MARK: - Enums
    
    /**
    A Result type to use with network requests
     
     - IsSuccess: A tuple containing: isSuccess: Bool, statusCode: Int?, result: T, token: String?
     - Error: A tuple containing: error: Error, statusCode: Int?, result: T?
     */
    public enum ResultType<T> {
        
        /// Result is success. A tuple containing: isSuccess: Bool, statusCode: Int?, result: JSON
        case isSuccess(isSuccess: Bool, statusCode: Int?, result: T, token: String?)
        /// Result is error. A tuple containing: error: Error, statusCode: Int?, result: JSON
        case error(error: Error, statusCode: Int?, result: T?)
    }
    
    // MARK: - Request methods
    
    /**
     Makes ansychronous JSON request
     Closure for caller to handle
     
     - parameter url: The URL to connect to
     - parameter method: The method to use in connecting with the URL
     - parameter encoding: The encoding to use in the request
     - parameter contentType: The content type of the request
     - parameter parameters: The parameters in the request
     - parameter headers: The headers in the request
     - parameter completion: The completion handler to execute upon completing the request
     */
    public static func asynchronousRequest( _ url: String, method: HTTPMethod, encoding: ParameterEncoding, contentType: String, parameters: Dictionary<String, Any>, headers: Dictionary<String, String>, completion: @escaping (_ r: HATNetworkHelper.ResultType<JSON>) -> Void) {
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager: SessionManager = Alamofire.SessionManager(configuration: configuration)
        
        // do a post
        manager.request(
            url, /* request url */
            method: method, /* GET, POST, etc*/
            parameters: parameters, /* parameters to POST*/
            encoding: encoding, /* encoding type, JSON, URLEncoded, etc*/
            headers: headers /* request header */
            )
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    
                    let header: [AnyHashable: Any]? = response.response?.allHeaderFields
                    if let stringHeaders: [String: String] = header as? [String: String], let url: URL = (response.response?.url!) {
                        
                        let cookies: [HTTPCookie] = HTTPCookie.cookies(withResponseHeaderFields: stringHeaders, for: url)
                        manager.session.configuration.httpCookieStorage?.setCookies(cookies, for: url, mainDocumentURL: nil)
                    }
                    
                    if response.response?.statusCode == 401 {
                        
                        completion(HATNetworkHelper.ResultType.error(error: AuthenicationError.tokenValidationFailed("expired"), statusCode: response.response?.statusCode, result: nil))
                    } else if response.response?.statusCode == 403 {
                        
                        completion(HATNetworkHelper.ResultType.error(error: AuthenicationError.tokenValidationFailed("forbidden"), statusCode: response.response?.statusCode, result: nil))
                    } else if 200 ... 299 ~= response.response!.statusCode {
                        
                        let token: String? = header?[RequestHeaders.xAuthToken] as? String

                        // check if we have a value and return it
                        guard let value: Any = response.result.value else {
                            
                            completion(HATNetworkHelper.ResultType.error(error: HATError.generalError("Unexpected Error", response.response?.statusCode, nil), statusCode: response.response?.statusCode, result: nil))
                            return
                        }
                        
                        completion(HATNetworkHelper.ResultType.isSuccess(isSuccess: true, statusCode: response.response?.statusCode, result: JSON(value), token: token))
                    } else {
                        
                        completion(HATNetworkHelper.ResultType.error(error: HATError.generalError("Unexpected Error", response.response?.statusCode, nil), statusCode: response.response?.statusCode, result: nil))
                    }
                // in case of failure return the error but check for internet connection or unauthorised status and let the user know
                case .failure(let error):
                    
                    guard let value: Any = response.result.value else {
                        
                        completion(HATNetworkHelper.ResultType.error(error: error, statusCode: response.response?.statusCode, result: nil))
                        return
                    }
                    
                    completion(HATNetworkHelper.ResultType.error(error: error, statusCode: response.response?.statusCode, result: JSON(value)))
                }
            }
            .session.finishTasksAndInvalidate()
    }
    
    /**
     Makes ansychronous string request
     Closure for caller to handle
     
     - parameter url: The URL to connect to
     - parameter method: The method to use in connecting with the URL
     - parameter encoding: The encoding to use in the request
     - parameter contentType: The content type of the request
     - parameter parameters: The parameters in the request
     - parameter headers: The headers in the request
     - parameter completion: The completion handler to execute upon completing the request
     */
    public static func asynchronousStringRequest(_ url: String, method: HTTPMethod, encoding: ParameterEncoding, contentType: String, parameters: Dictionary<String, Any>, headers: Dictionary<String, String>, completion: @escaping (_ r: HATNetworkHelper.ResultType<String>) -> Void) {
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager: SessionManager = Alamofire.SessionManager(configuration: configuration)
        
        // do a post
        manager.request(
            url, /* request url */
            method: method, /* GET, POST, etc*/
            parameters: parameters, /* parameters to POST*/
            encoding: encoding, /* encoding type, JSON, URLEncoded, etc*/
            headers: headers /* request header */
            )
            .validate(statusCode: 200..<300)
            .validate(contentType: [contentType])
            .responseString { response in
                
                switch response.result {
                case .success:
                    
                    let header: [AnyHashable: Any]? = response.response?.allHeaderFields
                    let token: String? = header?[RequestHeaders.xAuthToken] as? String
                    
                    // check if we have a value and return it
                    guard let value: String = response.result.value else {
                        
                        completion(HATNetworkHelper.ResultType.error(error: HATError.generalError("Unexpected Error", response.response?.statusCode, nil), statusCode: response.response?.statusCode, result: nil))
                        return
                    }
                    
                    completion(HATNetworkHelper.ResultType.isSuccess(isSuccess: true, statusCode: response.response?.statusCode, result: value, token: token))
                // return the error
                case .failure(let error):
                    
                    completion(HATNetworkHelper.ResultType.error(error: error, statusCode: response.response?.statusCode, result: nil))
                }
            }
            .session.finishTasksAndInvalidate()
    }
    
    // MARK: - Upload file
    
    /**
     Uploads a specified file to the url provided
     
     - parameter image: A `Data` type representation of the image in order to upload it
     - parameter url: The url to upload the file to
     - parameter progressUpdateHandler: A function to execute in order to get the percentage of the upload completed so far
     - parameter completion: A function to execute if everything is ok
     */
    public static func uploadFile(image: Data, url: String, progressUpdateHandler: ((Double) -> Void)?, completion: @escaping (_ r: HATNetworkHelper.ResultType<JSON>) -> Void) {
        
        let headers: [String: String] = [RequestHeaders.serverEncryption: RequestHeaders.serverEncryptionAES256]
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        let manager: SessionManager = Alamofire.SessionManager(configuration: configuration)
        
        manager.upload(
            image,
            to: URL(string: url)!,
            method: .put,
            headers: headers)
            .uploadProgress { progress -> Void in
            
                progressUpdateHandler?(progress.fractionCompleted)
            }
            .responseString { response in
                
                switch response.result {
                case .success:
                    
                    let header: [AnyHashable: Any]? = response.response?.allHeaderFields
                    let token: String? = header?[RequestHeaders.xAuthToken] as? String
                    
                    // check if we have a value and return it
                    guard let value: String = response.result.value else {
                        
                        completion(HATNetworkHelper.ResultType.error(error: HATError.generalError("Unexpected Error", response.response?.statusCode, nil), statusCode: response.response?.statusCode, result: nil))
                        return
                    }
                    
                    completion(HATNetworkHelper.ResultType.isSuccess(isSuccess: true, statusCode: response.response?.statusCode, result: JSON(value), token: token))
                // return the error
                case .failure(let error):
                    
                    guard let value: Any = response.result.value else {
                        
                        completion(HATNetworkHelper.ResultType.error(error: error, statusCode: response.response?.statusCode, result: nil))
                        return
                    }

                    completion(HATNetworkHelper.ResultType.error(error: error, statusCode: response.response?.statusCode, result: JSON(value)))
                }
            }
            .session.finishTasksAndInvalidate()
    }
    
    // MARK: - Query from string
    
    /**
     Gets a param value from a url
     
     - parameter url: The url to extract the parameters from
     - parameter param: The parameter
     
     - returns: String or nil if not found
     */
    public static func getQueryStringParameter(url: String?, param: String) -> String? {
        
        if let url: String = url, let urlComponents: NSURLComponents = NSURLComponents(string: url), let queryItems: [URLQueryItem] = (urlComponents.queryItems) {
            
            let parameter: URLQueryItem? = queryItems.first { item in item.name == param }
            return parameter?.value
        }
        
        return nil
    }
}
