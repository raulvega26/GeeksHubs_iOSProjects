//
//  Presenter.swift
//  VIPER
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

class Presenter {
    var view: TableViewController?
    var interactor: Interactor?
    var routing: Routing?
    
    func openCreatePersonViewController() {
        routing?.openCreatePersonViewController()
    }
    
    func addPerson(name: String, surname: String) {
        interactor?.addPerson(name: name, surname: surname)
    }
    
    func updatePersons(persons: [String]) {
        view?.populatePersons(persons: persons)
    }
}
