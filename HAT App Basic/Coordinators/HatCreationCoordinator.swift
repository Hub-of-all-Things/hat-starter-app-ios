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

class HatCreationCoordinator: Coordinator, CoordinatorDelegate {
    
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
        
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Variables
    
    /// The order and the names of the viewControllers to show
    let loginViewControllersOrder: [Int: String] = [0 : "CreateAccountViewController",
                                                    1 : "ChooseHATAddressViewController"]
    
    // MARK: - Stop coordinator
    
    /**
     Stops the coordinator. Removes all of the childCoordinators, pops the last UIVIewController from the navigationController and notifies the delegate
     */
    func stop() {
        
        self.childCoordinators.removeAll()
        navigationController.popToRootViewController(animated: true)
        delegate?.didFinish(coordinator: self)
    }
    
    // MARK: - Go to next screen
    
    /**
     Goes to the next UIViewController in line
     
     - parameter fromViewController: The viewController that initiated the next ViewController
     */
    func goToNextScreen(fromViewController: HATCreationUIViewController)  {
        
        guard let vc = self.getNextViewController(currentViewController: fromViewController) else { return }
        vc.purchaseModel = fromViewController.purchaseModel
        vc.coordinator = fromViewController.coordinator
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    /**
     <#Function Details#>
     
     - parameter currentViewController: The viewController that initiated the next ViewController
     
     - returns: <#Returns#>
     */
    func getNextViewController(currentViewController: HATCreationUIViewController) -> HATCreationUIViewController? {
        
        let possibleCurrentViewControllerNumber = self.loginViewControllersOrder.first(where: { $1 == currentViewController.restorationIdentifier ?? ""})?.key
        
        guard let currentViewControllerNumber = possibleCurrentViewControllerNumber, currentViewControllerNumber >= 0 && currentViewControllerNumber < self.loginViewControllersOrder.count else { return nil }
        
        let nextViewControllerName = self.loginViewControllersOrder[currentViewControllerNumber + 1]
        
        return HATCreationUIViewController.instantiate(viewControllerName: nextViewControllerName)
    }
}
