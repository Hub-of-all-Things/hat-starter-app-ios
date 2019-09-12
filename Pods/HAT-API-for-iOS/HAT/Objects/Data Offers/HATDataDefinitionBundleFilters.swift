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

public struct HATDataDefinitionBundleFilters: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `hatOperator` in JSON is `operator`
     * `field` in JSON is `field`
     * `transformation` in JSON is `transformation`
     */
    private enum CodingKeys: String, CodingKey {
        
        case hatOperator = "operator"
        case field = "field"
        case transformation = "transformation"
    }
        
    // MARK: - Variables
    
    /// the field that we want to filter
    public var field: String = ""
    /// The transformation to be done on the field. Optional
    public var transformation: Dictionary<String, String>?
    /// The operator of the filter. Can be `contains`, `in`, `between` and `find`. Optional
    public var hatOperator: HATOperator?
    
    // MARK: - Initializer
    
    /**
     Tries to decode the JSON into the struct `DataOfferRequiredDataDefinitionBundleFiltersV2`. Can throw
     
     - parameter decoder: The decoder to use during the decoding process
     */
    public init(from decoder: Decoder) throws {
        
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        self.field = try container.decode(String.self, forKey: .field)
        do {
            
            self.transformation = try container.decode(Dictionary<String, String>?.self, forKey: .transformation)
        } catch {
            
            self.transformation = nil
        }
        
        do {
            
            let tempOperator: HATOperator? = try container.decode(HATOperator?.self, forKey: .hatOperator)
            
            switch tempOperator?.operatorType {
                
            case .operatorFind?:
                
                do {
                    
                    self.hatOperator = try container.decode(OperatorFind.self, forKey: .hatOperator)
                } catch {
                    
                    self.hatOperator = nil
                }
            case .operatorBetween?:
                
                do {
                    
                    self.hatOperator = try container.decode(OperatorBetween.self, forKey: .hatOperator)
                } catch {
                    
                    self.hatOperator = nil
                }
            case .operatorContains?:
                
                do {
                    
                    self.hatOperator = try container.decode(OperatorContains.self, forKey: .hatOperator)
                } catch {
                    
                    self.hatOperator = nil
                }
            case .operatorIn?:
                
                do {
                    
                    self.hatOperator = try container.decode(OperatorIn.self, forKey: .hatOperator)
                } catch {
                    
                    self.hatOperator = nil
                }
            case .none:
                
                self.hatOperator = nil
            }
        } catch {
            
            self.hatOperator = nil
        }
    }
}
