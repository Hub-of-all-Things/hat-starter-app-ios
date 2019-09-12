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

// MARK: Protocol

protocol CoordinatorDelegate: AnyObject {
    
    // MARK: - Protocol Functions

    /**
     A function to inform the delegate, usually the main coordinator or the parent coordinator, that the coordinator finished it's lifecycle
     
     - parameter coordinator: The coordinator that finished it's lifecycle
     */
    func didFinish(coordinator: Coordinator)
    
    /**
     A function to inform the delegate, usually the main coordinator or the parent coordinator, that the coordinator finish it's lifecycle and needs to be replaced by a new coordinator
     
     - parameter coordinator: The old coordinator that needs to be replaced
     - parameter newCoordinator: The new coordinator that needs to replace the old one and become active
     */
    func replaceCoordinator(_ coordinator: Coordinator, with newCoordinator: Coordinator)
    
    /**
     A function to inform the delegate, usually the main coordinator or the parent coordinator, that the coordinator started it's lifecycle
     
     - parameter coordinator: The coordinator that just started it's lifecycle
     */
    func didStart(coordinator: Coordinator)
}

// MARK: - Extension

extension CoordinatorDelegate {
    
    // MARK: - Extension's Functions
    
    func replaceCoordinator(_ coordinator: Coordinator, with newCoordinator: Coordinator) { }
}
