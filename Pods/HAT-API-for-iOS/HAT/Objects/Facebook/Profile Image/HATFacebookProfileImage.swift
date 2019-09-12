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

public struct HATFacebookProfileImage: HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `recordID` in JSON is `recordId`
     * `data` in JSON is `data`
     * `isSilhouette` in JSON is `is_silhouette`
     * `height` in JSON is `height`
     * `width` in JSON is `width`
     * `url` in JSON is `url`
     * `endpoint` in JSON is `endpoint`
     * `lastUpdated` in JSON is `lastUpdated`
     * `imageData` in JSON is `imageData`
     */
    private enum CodingKeys: String, CodingKey {
        
        case recordID = "recordId"
        case data = "data"
        case isSilhouette = "is_silhouette"
        case height = "height"
        case width = "width"
        case url = "url"
        case endPoint = "endpoint"
        case lastUpdated = "lastUpdated"
        case imageData = "imageData"
    }
    
    // MARK: - Variables
    
    /// Is image a Silhouette
    public var isSilhouette: Bool = false
    /// The url of the image
    public var url: String = ""
    /// The height of the image
    public var imageHeight: Int = 0
    /// The width of the image
    public var imageWidth: Int = 0
    /// The date the image was last updated as unix time stamp
    public var lastUpdated: Int = 0
    /// The record id in the HAT
    public var recordID: String?
    /// The endpoint of the image
    public var endPoint: String = "profile_picture"
    /// The downloaded image, used in order to cache it for later use
    public var image: UIImage?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isSilhouette = false
        url = ""
        imageWidth = 0
        imageHeight = 0
        lastUpdated = 0
        recordID = ""
        endPoint = "profile_picture"
        image = UIImage()
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {
        
        self.init()
        
        if let tempRecordID: String = dictionary[CodingKeys.recordID.rawValue]?.stringValue {
            
            recordID = tempRecordID
        }
        
        if let tempEndPoint: String = dictionary[CodingKeys.endPoint.rawValue]?.stringValue {
            
            endPoint = tempEndPoint
        }
        
        if let data: [String: JSON] = dictionary[CodingKeys.data.rawValue]?.dictionaryValue {
            
            // In new v2 API last updated will be inside data
            if let tempLastUpdated: String = data[CodingKeys.lastUpdated.rawValue]?.stringValue {
                
                if let date: Date = HATFormatterHelper.formatStringToDate(string: tempLastUpdated) {
                    
                    lastUpdated = Int(HATFormatterHelper.formatDateToEpoch(date: date)!)!
                }
            }
            if let tempSilhouette: Bool = dictionary[CodingKeys.isSilhouette.rawValue]?.boolValue {
                
                isSilhouette = tempSilhouette
            }
            if let tempHeight: String = dictionary[CodingKeys.height.rawValue]?.string {
                
                imageHeight = Int(tempHeight)!
            }
            if let tempWidth: String = dictionary[CodingKeys.width.rawValue]?.stringValue {
                
                imageWidth = Int(tempWidth)!
            }
            if let tempLink: String = dictionary[CodingKeys.url.rawValue]?.stringValue {
                
                url = tempLink
            }
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempRecordID: String = dict[CodingKeys.recordID.rawValue]?.stringValue {
            
            recordID = tempRecordID
        }
        
        if let tempEndPoint: String = dict[CodingKeys.endPoint.rawValue]?.stringValue {
            
            endPoint = tempEndPoint
        }
        
        if let data: [String: JSON] = dict[CodingKeys.data.rawValue]?.dictionaryValue {
            
            // In new v2 API last updated will be inside data
            if let tempLastUpdated: String = data[CodingKeys.lastUpdated.rawValue]?.stringValue {
                
                if let date: Date = HATFormatterHelper.formatStringToDate(string: tempLastUpdated) {
                    
                    lastUpdated = Int(HATFormatterHelper.formatDateToEpoch(date: date)!)!
                }
            }
            if let tempSilhouette: Bool = dict[CodingKeys.isSilhouette.rawValue]?.boolValue {
                
                isSilhouette = tempSilhouette
            }
            if let tempHeight: String = dict[CodingKeys.height.rawValue]?.string {
                
                imageHeight = Int(tempHeight)!
            }
            if let tempWidth: String = dict[CodingKeys.width.rawValue]?.stringValue {
                
                imageWidth = Int(tempWidth)!
            }
            if let tempLink: String = dict[CodingKeys.url.rawValue]?.stringValue {
                
                url = tempLink
            }
        }
    }
    
    /**
     It initialises everything from the received JSON file from the cache
     
     - fromCache: The Dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let dictionary: JSON = JSON(fromCache)
        self.inititialize(dict: dictionary.dictionaryValue)
        if let tempImage: Data = fromCache[CodingKeys.imageData.rawValue] as? Data {
            
            self.image = UIImage(data: tempImage)
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.recordID.rawValue: self.recordID ?? "-1",
            CodingKeys.isSilhouette.rawValue: self.isSilhouette,
            CodingKeys.url.rawValue: self.url,
            CodingKeys.height.rawValue: self.imageHeight,
            CodingKeys.width.rawValue: self.imageWidth,
            CodingKeys.endPoint.rawValue: self.endPoint,
            CodingKeys.lastUpdated.rawValue: HATFormatterHelper.formatDateToISO(date: Date()),
            CodingKeys.imageData.rawValue: (self.image ?? UIImage()).jpegData(compressionQuality: 1.0) ?? UIImage()
        ]
    }
}
