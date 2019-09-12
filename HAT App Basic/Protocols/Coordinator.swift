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

// MARK: Class

protocol Coordinator: AnyObject {
    
    // MARK: - Variables
    
    /// An array to store the child coordinators
    var childCoordinators: [Coordinator] { get set }
    /// The UINavigationController to use with this coordinator. Usually it's initialized from a previous coordinator
    var navigationController: UINavigationController { get set }
    /// A delegate to use in order to send events, like didStart and didStop. Usually the events are sent to the parent coordinator
    var delegate: CoordinatorDelegate? { get set }
    
    // MARK: - Functions
    
    /**
     It starts the coordinator. The coordinator should initiate the first view controller and push in to the UINavigationController. In case the coordinator iniates another coordinator it has to add it to childCoordinators as well.
     */
    func start()
    
    // MARK: - Initializes
    
    /**
     It initiates the coordinator. It sets the navigatonController and starts the coordinator.
     
     - parameter navigationController: The UINavigationController to use with this coordinator
     */
    init(navigationController: UINavigationController)
}
