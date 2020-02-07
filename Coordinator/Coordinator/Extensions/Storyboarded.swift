//
//  Storyboarded.swift
//  Coordinator
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullname = NSStringFromClass(self)
        print(fullname)
        let className = fullname.components(separatedBy: ".")[1]
        print(className)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: className) as! Self
    }
}

extension UIViewController: Storyboarded { }
