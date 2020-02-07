//
//  CreatePersonViewController.swift
//  VIPER
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

class CreatePersonViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var surnameTextField: UITextField?
    
    var presenter: Presenter?
    
    @IBAction func createWasPressed(_ sender: UIButton) {
        presenter?.addPerson(name: nameTextField!.text!, surname: nameTextField!.text!)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
