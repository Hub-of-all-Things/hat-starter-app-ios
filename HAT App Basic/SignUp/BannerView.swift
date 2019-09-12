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

// MARK: Class

class BannerView: UIView {
    
    // MARK: - Show
    
    /**
     Shows banner with the correct `text` and animation
     
     - parameter banner: The banner `UIView` to show and animate
     - parameter label: The `UILabel` to show the error message
     - parameter bannerConstraint: The height constraint of the `banner`
     - parameter text: The `text` to update the selectedHATClusterLabel `UILabel` with
     - parameter mainView: The `UIView` that will animate the constraint changes
     */
    class func showBanner(_ banner: UIView, label: UILabel, bannerConstraint: NSLayoutConstraint, text: String, mainView: UIViewController) {
        
        guard bannerConstraint.constant == 0 else {
            
            label.text = text
            return
        }
        
        banner.addBorder(width: 1, color: .red)
        banner.frame = CGRect(x: CGFloat(-2), y: CGFloat(-100), width: banner.frame.width + 10, height: banner.frame.height)
        label.text = text
        UIView.transition(with: banner, duration: 0, options: .transitionCrossDissolve, animations: {
            
            label.isHidden = false
            banner.isHidden = false
        }, completion: { completion in
            
            guard completion else { return }
            let height = text.calculateLabelHeight(maxWidth: UIScreen.main.bounds.width - 78, font: UIFont.systemFont(ofSize: 12))
            banner.frame = CGRect(x: CGFloat(-2), y: CGFloat(-10), width: banner.frame.width + 10, height: banner.frame.height)
            bannerConstraint.constant = height + 34
            UIView.animate(withDuration: 0.2, animations: {
                
                mainView.view.layoutIfNeeded()
            })
        })
    }
    
    // MARK: - Hide
    
    /**
     Hides the `banner` with animations from the `mainView`
     
     - parameter banner: The banner `UIView` to show and animate
     - parameter label: The `UILabel` to show the error message
     - parameter bannerConstraint: The height constraint of the `banner`
     - parameter mainView: The `UIView` that will animate the constraint changes
     */
    class func hideBanner(_ banner: UIView, label: UILabel, bannerConstraint: NSLayoutConstraint, mainView: UIView) {
        
        label.isHidden = true
        bannerConstraint.constant = 0
        UIView.animate(withDuration: 0.2, animations: {
            
            mainView.layoutIfNeeded()
        }, completion: { completed in
            
            guard completed else { return }
            
            UIView.transition(with: banner, duration: 0, options: .transitionCrossDissolve, animations: {
                
                banner.isHidden = true
            })
        })
    }
}
