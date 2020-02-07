//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let main = MyViewController.instantiate()
        main.coordinador = self
        navigationController.pushViewController(main, animated: true)
    }
    
    func openMainViewController() {
        let child = RedViewCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    
}
