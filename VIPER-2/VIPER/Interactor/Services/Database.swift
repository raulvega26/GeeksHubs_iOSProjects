//
//  Database.swift
//  VIPER
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import Foundation

class Database {
    var persons = [Person]()
    
    func add(person: Person) {
        persons.append(person)
    }
}
