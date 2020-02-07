//
//  TableViewController.swift
//  VIPER
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var presenter: Presenter?
    var persons = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWasPressed(_:)))
    }
    
    @objc func addWasPressed(_ sender: UIButton) {
        presenter?.openCreatePersonViewController()
    }
}

extension TableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let person = persons[indexPath.row]
        cell.textLabel?.text = person

        return cell
    }
    
}

extension TableViewController: ViewProtocol {
    func populatePersons(persons: [String]) {
        self.persons = persons
        self.tableView.reloadData()
    }
}
