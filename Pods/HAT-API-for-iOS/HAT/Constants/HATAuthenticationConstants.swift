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

// MARK: Headers

/**
 The request headers used in various network requests
 */
public enum RequestHeaders {
    
    // MARK: - Variables
    
    /// The `x-Auth-Token` name in the header, used to store the user's token
    public static let xAuthToken: String = "x-auth-token"
    /// The `token` name in the headers
    public static let tokenParamName: String = "token"
    /// The `x-amz-server-side-encryption` name in the headers
    public static let serverEncryption: String = "x-amz-server-side-encryption"
    /// The `AES256` value in the headers for `x-amz-server-side-encryption`
    public static let serverEncryptionAES256: String = "AES256"
}

// MARK: - Content type

/**
 The content type used in various network requests
 */
public enum ContentType {
    
    // MARK: - Variables
    
    /// The `application/json` content type
    public static let json: String = "application/json"
    /// The `text/plain` content type
    public static let text: String = "text/plain"
}

// MARK: - Location Plug Credentials

/**
 The authentication data used by location service. Used when enabling the location plug
 */
public enum HATDataPlugCredentials {
    
    // MARK: - Variables
    
    /// market data plug id used for location data plug
    static let dataPlugID: String = "c532e122-db4a-44b8-9eaf-18989f214262"
    /// market access token used for location data plug
    static let locationDataPlugToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxLVZTUDcrb0RleldPejBTOFd6MHhWM0J2eVNOYzViNnRcLzRKXC85TVlIWTQrVDdsSHdUSDRXMVVEWGFSVnVQeTFPZmtNajNSNDBjeTVERFRhQjZBNE44c3FGSTJmMUE1NzZUYjhiYmhhUT0iLCJpc3MiOiJoYXQtbWFya2V0IiwiZXhwIjoxNTI2OTc4OTkyLCJpYXQiOjE0OTYyMjA1OTIsImp0aSI6ImY0NTQ4NzI5MGRlZTA3NDI5YmQxMGViMWZmNzJkZjZmODdiYzhhZDE0ZThjOGE3NmMyZGJlMjVhNDlmODNkOTNiMDJhMzg3NGI4NTI0NDhlODU0Y2ZmZmE0ZWQyZGY1MTYyZTBiYzRhNDk2NGRhYTlhOTc1M2EyMjA1ZjIzMzc5NWY3N2JiODhlYzQwNjQxZjM4MTk4NTgwYWY0YmExZmJkMDg5ZTlhNmU3NjJjN2NhODlkMDdhOTg3MmY1OTczNjdjYWQyYzA0NTdjZDhlODlmM2FlMWQ2MmRmODY3NTcwNTc3NTdiZDJjYzgzNTgyOTU4ZmZlMDVhNjI2NzBmNGMifQ.TvFs6Zp0E24ChFqn3rBP-cpqxZbvkhph91UILGJvM6U"
}
