//
//  ViewController.swift
//  Coordinator
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    weak var coordinador: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonWasPressed(_ sender: Any) {
        coordinador?.openMainViewController()
    }
}
