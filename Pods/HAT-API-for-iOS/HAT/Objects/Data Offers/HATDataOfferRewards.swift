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

public struct HATDataOfferRewards: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `rewardType` in JSON is `rewardType`
     * `rewardVendor` in JSON is `vendor`
     * `vendorURL` in JSON is `vendorUrl`
     * `rewardValue` in JSON is `value`
     * `currency` in JSON is `currency`
     * `codesReuseable` in JSON is `codesReuseable`
     * `codes` in JSON is `codes`
     * `cashValue` in JSON is `cashValue`
     */
    private enum CodingKeys: String, CodingKey {
        
        case rewardType = "rewardType"
        case vendor = "vendor"
        case vendorURL = "vendorUrl"
        case rewardValue = "value"
        case rewardValueInt = "rewardValueInt"
        case currency = "currency"
        case areCodesReusable = "codesReuseable"
        case codes = "codes"
        case cashValue = "cashValue"
    }
    
    // MARK: - Variables
    
    /// The reward type of the offer. Can be `cash`, `voucher` or `service`
    public var rewardType: String = ""
    /// The vendor of the offer
    public var vendor: String = ""
    /// The vendor URL, possibly the website of the vendor
    public var vendorURL: String = ""
    /// The reward value of the offer
    public var rewardValue: Int = 0
    /// The reward value of the offer as Int. Optional
    public var rewardValueInt: Int?
    /// Is the code of the reward able to be reused, in case of `voucher` type. Optional
    public var areCodesReusable: Bool?
    /// The possible codes as rewards, in case of `voucher` type. Optional
    public var codes: [String]?
    /// The cash value of the reward, in case of `cash` type. Optional
    public var cashValue: HATDataOfferRewardsCashValue?
    /// The currency of the reward, in case of `cash` type. Optional
    public var currency: String?
    
    // MARK: - Initialiser
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        rewardType = ""
        vendor = ""
        vendorURL = ""
        rewardValue = 0
        rewardValueInt = nil
        areCodesReusable = nil
        codes = nil
        cashValue = nil
        currency = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempRewardType: String = dictionary[HATDataOfferRewards.CodingKeys.rewardType.rawValue]?.string {
            
            rewardType = tempRewardType
        }
        
        if let tempVendor: String = dictionary[HATDataOfferRewards.CodingKeys.vendor.rawValue]?.string {
            
            vendor = tempVendor
        }
        
        if let tempVendorUrl: String = dictionary[HATDataOfferRewards.CodingKeys.vendorURL.rawValue]?.string {
            
            vendorURL = tempVendorUrl
        }
        
        if let tempValue: Int = dictionary[HATDataOfferRewards.CodingKeys.rewardValue.rawValue]?.int {
            
            rewardValue = tempValue
        }
        
        if let tempCurrency: String = dictionary[HATDataOfferRewards.CodingKeys.currency.rawValue]?.string {
            
            currency = tempCurrency
        }
        
        if let tempIntValue: Int = dictionary[HATDataOfferRewards.CodingKeys.rewardValue.rawValue]?.int {
            
            rewardValueInt = tempIntValue
        }
        
        if let tempCodeReusable: Bool = dictionary[HATDataOfferRewards.CodingKeys.areCodesReusable.rawValue]?.bool {
            
            areCodesReusable = tempCodeReusable
        }
        
        if let tempCodesArray: [JSON] = dictionary[HATDataOfferRewards.CodingKeys.codes.rawValue]?.array {
            
            codes = []
            for code: JSON in tempCodesArray {
                
                if let unwrappedCode: String = code.string {
                    
                    codes?.append(unwrappedCode)
                }
            }
        }
        
        if let tempCashValue: [String: JSON] = dictionary[HATDataOfferRewards.CodingKeys.cashValue.rawValue]?.dictionary {
            
            cashValue = HATDataOfferRewardsCashValue(dictionary: tempCashValue)
        }
    }
}
