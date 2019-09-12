//
/**
 * Copyright (C) 2019 Dataswift Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

import UIKit

protocol Storyboarded {
    
    static func instantiate(viewControllerName: String?) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(viewControllerName: String? = nil) -> Self {
        
        // this pulls out "MyApp.MyViewController"
        let fullName: String
        if viewControllerName != nil {
            
            fullName = ".\(viewControllerName!)"
        } else {
            
            fullName = NSStringFromClass(self)
        }
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
