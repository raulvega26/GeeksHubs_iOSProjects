//
//  RedViewCoordinator.swift
//  Coordinator
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

class RedViewCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let main = MainViewController.instantiate()
        main.coordinador = self
        navigationController.pushViewController(main, animated: true)
    }
}
