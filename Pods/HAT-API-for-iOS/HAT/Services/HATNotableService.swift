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

// MARK: Struct

/// A class about the methods concerning the Notables service
public struct HATNotablesService {
    
    // MARK: - Get Notes
    
    /**
     Gets the notes of the user from the HAT
     
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter parameters: The parameters to pass into the request, defaults are ["orderBy": "updated_time", "ordering": "descending"]
     - parameter success: A function executing on success returning ([HATNotesV2Object], String?) -> Void)
     - parameter failed: A function executing on failure returning (HATTableError) -> Void)
     */
    public static func getNotes(userDomain: String, userToken: String, parameters: Dictionary<String, String> = ["orderBy": "updated_time", "ordering": "descending"], success: @escaping (_ array: [HATNotes], String?) -> Void, failed: @escaping (HATTableError) -> Void) {
        
        func gotNotes(notesJSON: [JSON], newToken: String?) {
            
            var notes: [HATNotes] = []
            
            for item: JSON in notesJSON {
                
                if let note: [String: JSON] = item.dictionary {
                    
                    if let tempNote: HATNotes = (HATNotes.decode(from: note)) {
                        
                        notes.append(tempNote)
                    }
                }
            }
            
            success(notes, newToken)
        }
        
        HATAccountService.getHatTableValues(
            token: userToken,
            userDomain: userDomain,
            namespace: "rumpel",
            scope: "notablesv1",
            parameters: parameters,
            successCallback: gotNotes,
            errorCallback: failed)
    }
    
    // MARK: - Delete notes
    
    /**
     Deletes the specified notes from the hat
     
     - parameter noteIDs: The note IDs to delete from the hat
     - parameter userToken: The user's token
     - parameter userDomain: The user's domain
     - parameter success: A function to execute on success
     - parameter failed: A function to execute on failure
     */
    public static func deleteNotes(noteIDs: [String], userToken: String, userDomain: String, success: @escaping ((String) -> Void) = { _ in }, failed: @escaping ((HATTableError) -> Void) = { _ in }) {
        
        HATAccountService.deleteHatRecord(
            userDomain: userDomain,
            userToken: userToken,
            recordIds: noteIDs,
            success: { string in
                
                HATAccountService.triggerHatUpdate(userDomain: userDomain, completion: { () })
                success(string)
            },
            failed: failed)
    }
    
    // MARK: - Update note
    
    /**
     Updates a note from the hat
     
     - parameter note: The note object to update
     - parameter userToken: The user's token
     - parameter userDomain: The user's domain
     - parameter success: A function to execute on success
     - parameter failed: A function to execute on failure
     */
    public static func updateNote(note: HATNotes, userToken: String, userDomain: String, success: @escaping ((HATNotes, String?) -> Void) = { _, _  in }, failed: @escaping ((HATTableError) -> Void) = { _ in }) {
        
        HATAccountService.updateHatRecord(
            userDomain: userDomain,
            userToken: userToken,
            notes: [note],
            successCallback: { jsonArray, newToken in
                
                HATAccountService.triggerHatUpdate(userDomain: userDomain, completion: { () })
                
                let note: HATNotes = HATNotes(dict: jsonArray[0].dictionaryValue)
                success(note, newToken)
            },
            errorCallback: failed)
    }
    
    // MARK: - Post note
    
    /**
     Posts a note to hat
     
     - parameter userDomain: The user's domain
     - parameter userToken: The user's token
     - parameter note: The note object to post
     - parameter successCallBack: A function to execute on success
     - parameter errorCallback: A function to execute on failure
     */
    public static func postNote(userDomain: String, userToken: String, note: HATNotes, successCallBack: @escaping (HATNotes, String?) -> Void, errorCallback: @escaping (HATTableError) -> Void) {
        
        var tempNote: HATNotes = note
        if tempNote.data.locationV1?.latitude == nil {
            
            tempNote.data.locationV1 = nil
        }
        if tempNote.data.photoV1?.link?.isEmpty ?? true {
            
            tempNote.data.photoV1 = nil
        }
        
        // update JSON file with the values needed
        let hatData: [String: Any] = HATNotesData.encode(from: tempNote.data)! as [String: Any]
        
        HATAccountService.createTableValue(
            userToken: userToken,
            userDomain: userDomain,
            namespace: "rumpel",
            scope: "notablesv1",
            parameters: hatData,
            successCallback: { notes, newToken in
                
                HATAccountService.triggerHatUpdate(userDomain: userDomain, completion: { () })
                
                let note: HATNotes = HATNotes(dict: notes[0].dictionaryValue)
                successCallBack(note, newToken)
            },
            errorCallback: errorCallback)
    }
    
    // MARK: - Remove duplicates
    
    /**
     Removes duplicates from an array of NotesData and returns the corresponding objects in an array
     
     - parameter array: The HATNotesV2Object array
     
     - returns: An array of HATNotesV2Object
     */
    public static func removeDuplicatesFrom(array: [HATNotes]) -> [HATNotes] {
        
        // the array to return
        var arrayToReturn: [HATNotes] = []
        
        // go through each note object in the array
        for note: HATNotes in array {
            
            // check if the arrayToReturn it contains that value and if not add it
            let result: Bool = arrayToReturn.contains(where: {(note2: HATNotes) -> Bool in
                
                return note.recordID == note2.recordID
            })
            
            if !result {
                
                arrayToReturn.append(note)
            }
        }
        
        return arrayToReturn
    }
    
    // MARK: - Sort notables
    
    /**
     Sorts notes based on updated time
     
     - parameter notes: The HATNotesV2Object array
     
     - returns: An array of HATNotesV2Object
     */
    public static func sortNotables(notes: [HATNotes]) -> [HATNotes] {
        
        return notes.sorted { $0.data.updatedTime > $1.data.updatedTime }
    }
}
