//
//  Person.swift
//  VIPER
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

struct Person {
    var name: String
    var surname: String
    var fullname: String {
        get { "\(name) \(surname)" }
    }
}
