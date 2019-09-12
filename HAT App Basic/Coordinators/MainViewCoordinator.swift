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

class MainViewCoordinator: Coordinator, CoordinatorDelegate {
  
    // MARK: - CoordinatorDelegate protocol functions
    
    func didFinish(coordinator: Coordinator) {
        
        self.stop()
    }
    
    func didStart(coordinator: Coordinator) { }
    
    // MARK: - CoordinatorDelegate protocol Variables
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: CoordinatorDelegate?
    
    // MARK: - Coordinator protocol functions
    
    required init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        let nav = UINavigationController(rootViewController: vc)
        appdelegate.window!.rootViewController = nav
    }
    
    // MARK: - Stop coordinator
    
    /**
     Stops the coordinator. Removes all of the childCoordinators, pops the last UIVIewController from the navigationController and notifies the delegate
     */
    func stop() {
        
        self.childCoordinators.removeAll()
        navigationController.popToRootViewController(animated: true)
        delegate?.didFinish(coordinator: self)
    }
}
