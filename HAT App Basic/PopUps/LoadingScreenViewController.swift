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

internal class LoadingScreenViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var loadingMessageLabel: UILabel!
    @IBOutlet private weak var loadingButton: UIButton!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var baseView: UIView!
    
    // MARK: - Variable
    
    var completionAction: (() -> Void)?
    
    // MARK: - IBAction
    
    /**
     Executes some function
     
     - parameter sender: The object that called this function
     */
    @IBAction private func loadingButtonAction(_ sender: Any) {
        
        completionAction?()
    }
    
    // MARK: - View Controller funtions
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
}
