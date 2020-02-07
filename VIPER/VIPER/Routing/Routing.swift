//
//  Routing.swift
//  VIPER
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

class Routing {
    let vc: TableViewController = TableViewController()
    var presenter = Presenter()
    let interactor = Interactor()
    var navigationController: UINavigationController?
    
    init() {
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
        navigationController = UINavigationController(rootViewController: vc)
    }
}
