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

// MARK: Struct

public struct HATGoogleCalendarAttachments: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `fileId` in JSON is `fileId`
     * `fileUrl` in JSON is `fileUrl`
     * `iconLink` in JSON is `iconLink`
     * `title` in JSON is `title`
     * `mimeType` in JSON is `mimeType`
     */
    private enum CodingKeys: String, CodingKey {
        
        case fileID = "fileId"
        case fileURL = "fileURL"
        case iconLink = "iconLink"
        case title = "title"
        case mimeType = "mimeType"
    }
    
    // MARK: - Variables
    
    /// ID of the attached file. Read-only.
    /// For Google Drive files, this is the ID of the corresponding [Files](https://developers.google.com/drive/v3/reference/files) resource entry in the Drive API.
    public var fileID: String = ""
    /// URL link to the attachment.
    /// For adding Google Drive file attachments use the same format as in **alternateLink** property of the **Files** resource in the Drive API.
    public var fileURL: String = ""
    /// URL link to the attachment's icon. Read-only.
    public var iconLink: String = ""
    /// Internet media type (MIME type) of the attachment. Optional
    public var mimeType: String?
    /// Attachment title.
    public var title: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
