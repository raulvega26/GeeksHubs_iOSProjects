//
//  Interactor.swift
//  VIPER
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

class Interactor {
    var presenter: Presenter?
    var database = Database()
    
    func addPerson(name: String, surname: String) {
        let person = Person(name: name, surname: surname)
        database.add(person: person)
        updatePersons()
    }
    
    func updatePersons() {
        let fullnames = database.persons.map{ $0.fullname }
        presenter?.updatePersons(persons: fullnames)
    }
}
