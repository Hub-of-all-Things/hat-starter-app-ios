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

import SwiftyJSON

// MARK: Struct

public struct HATFileUpload: HatApiType, Comparable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `fileID` in JSON is `fileId`
     * `name` in JSON is `name`
     * `source` in JSON is `source`
     * `tags` in JSON is `tags`
     * `title` in JSON is `title`
     * `description` in JSON is `description`
     * `dateCreated` in JSON is `dateCreated`
     * `lastUpdated` in JSON is `lastUpdated`
     * `contentUrl` in JSON is `contentUrl`
     * `isContentPublic` in JSON is `isContentPublic`
     * `status` in JSON is `status`
     * `permissions` in JSON is `permissions`
     * `unixTimeStamp` in JSON is `unixTimeStamp`
     */
    private enum CodingKeys: String, CodingKey {
        
        case fileID = "fileId"
        case name = "name"
        case source = "source"
        case tags = "tags"
        case title = "title"
        case description = "description"
        case dateCreated = "dateCreated"
        case lastUpdated = "lastUpdated"
        case contentUrl = "contentUrl"
        case isContentPublic = "contentPublic"
        case status = "status"
        case permissions = "permissions"
        case unixTimeStamp = "unixTimeStamp"
    }
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATFileUpload, rhs: HATFileUpload) -> Bool {
        
        return (lhs.dateCreated == rhs.dateCreated)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: HATFileUpload, rhs: HATFileUpload) -> Bool {
        
        if lhs.lastUpdated != nil && rhs.lastUpdated != nil {
            
            return lhs.lastUpdated! < rhs.lastUpdated!
        }
        
        return false
    }
    
    // MARK: - Variables
    
    /// The file ID of the uploaded file
    public var fileID: String = ""
    /// The name of the uploaded file, usually the name of app that uploads the file followed by a randomly generated string
    public var name: String = ""
    /// The source of the uploaded file, the name of the app
    public var source: String = ""
    /// The tags of the uploaded file. Tags are usefull when searching for a file
    public var tags: [String] = []
    /// The image of the uploaded file. Used for caching the image. Optional.
    public var image: UIImage?
    /// The title of the uploaded file
    public var title: String = ""
    /// A short description of the uploaded file
    public var fileDescription: String = ""
    /// The created date of the uploaded file. Optional
    public var dateCreated: Date?
    /// The last updated date of the uploaded file. Optional
    public var lastUpdated: Date?
    /// The current status of the uploaded file. Can be `new` or `completed` when the upload has been marked as complete. Also you can find the total file size here
    public var status: HATFileUploadStatus = HATFileUploadStatus()
    /// The image url of the uploaded file
    public var contentURL: String = ""
    /// A flag identifying if the uploaded file public
    public var isContentPublic: Bool = false
    /// The permissions of the uploaded file
    public var permisions: [HATFileUploadPermissions] = []
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        fileID = ""
        name = ""
        source = ""
        tags = []
        image = nil
        title = ""
        fileDescription = ""
        dateCreated = nil
        lastUpdated = nil
        status = HATFileUploadStatus()
        contentURL = ""
        isContentPublic = false
        permisions = []
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public init(from dict: Dictionary<String, JSON>) {
        
        self.assingValues(dict: dict)
    }
    
    /**
     It assignes everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    mutating func assingValues(dict: Dictionary<String, JSON>) {
        
        if let tempFileID: String = dict[CodingKeys.fileID.rawValue]?.stringValue {
            
            fileID = tempFileID
        }
        if let tempName: String = dict[CodingKeys.name.rawValue]?.stringValue {
            
            name = tempName
        }
        if let tempSource: String = dict[CodingKeys.source.rawValue]?.stringValue {
            
            source = tempSource
        }
        if let tempTags: [JSON] = dict[CodingKeys.tags.rawValue]?.arrayValue {
            
            for tag: JSON in tempTags {
                
                tags.append(tag.stringValue)
            }
        }
        if let tempTitle: String = dict[CodingKeys.title.rawValue]?.stringValue {
            
            title = tempTitle
        }
        if let tempFileDescription: String = dict[CodingKeys.description.rawValue]?.stringValue {
            
            fileDescription = tempFileDescription
        }
        if let tempDateCreated: Int = dict[CodingKeys.dateCreated.rawValue]?.intValue {
            
            dateCreated = Date(timeIntervalSince1970: TimeInterval(tempDateCreated))
        }
        if let tempLastUpdate: Int = dict[CodingKeys.lastUpdated.rawValue]?.intValue {
            
            lastUpdated = Date(timeIntervalSince1970: TimeInterval(tempLastUpdate))
        }
        if let tempContentURL: String = dict[CodingKeys.contentUrl.rawValue]?.stringValue {
            
            contentURL = tempContentURL
        }
        if let tempContentPublic: Bool = dict[CodingKeys.isContentPublic.rawValue]?.boolValue {
            
            isContentPublic = tempContentPublic
        }
        if let tempStatus: [String: JSON] = dict[CodingKeys.status.rawValue]?.dictionary {
            
            status = HATFileUploadStatus(from: tempStatus)
        }
        if let tempPermissions: [JSON] = dict[CodingKeys.permissions.rawValue]?.arrayValue {
            
            for item: JSON in tempPermissions {
                
                permisions.append(HATFileUploadPermissions(from: item.dictionaryValue))
            }
        }
    }
    
    /**
     It initialises everything from the received JSON file from the cache
     
     - fromCache: The Dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let json: JSON = JSON(fromCache)
        self.assingValues(dict: json.dictionaryValue)
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        var array: [Dictionary<String, Any>] = []
        
        for permision: HATFileUploadPermissions in self.permisions {
            
            array.append(permision.toJSON())
        }
        
        var tempDateCreated: Int = 0
        var tempLastUpdated: Int = 0
        
        if self.dateCreated == nil {
            
            tempDateCreated = Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        } else {
            
            tempDateCreated = Int(HATFormatterHelper.formatDateToEpoch(date: self.dateCreated!)!)!
        }
        
        if self.lastUpdated == nil {
            
            tempLastUpdated = Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        } else {
            
            tempLastUpdated = Int(HATFormatterHelper.formatDateToEpoch(date: self.lastUpdated!)!)!
        }
        
        return [
            
            CodingKeys.fileID.rawValue: self.fileID,
            CodingKeys.name.rawValue: self.name,
            CodingKeys.source.rawValue: self.source,
            CodingKeys.tags.rawValue: self.tags,
            CodingKeys.title.rawValue: self.title,
            CodingKeys.description.rawValue: self.fileDescription,
            CodingKeys.dateCreated.rawValue: tempDateCreated,
            CodingKeys.lastUpdated.rawValue: tempLastUpdated,
            CodingKeys.contentUrl.rawValue: self.contentURL,
            CodingKeys.isContentPublic.rawValue: self.isContentPublic,
            CodingKeys.status.rawValue: self.status.toJSON(),
            CodingKeys.permissions.rawValue: array,
            CodingKeys.unixTimeStamp.rawValue: Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
    }
}
