//
//  PostsFilteredTableViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 09/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

class PostsFilteredTableViewController: UITableViewController {
    var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        cell.backgroundColor = .red
        return cell
    }
}
