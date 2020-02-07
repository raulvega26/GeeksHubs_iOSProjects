//
//  PostsTableViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    var elements = [Post]()
    var name: String
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // MARK: - Properties
    private(set) var dataRetriever: DataRetriever!
    
    // MARK: - Life cycle
    init(dataRetriever: DataRetriever) {
        self.dataRetriever = dataRetriever
        self.name = "Posts"
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        self.name = "Posts"
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLSessionDataRetriever().retrieve(url: "https://jsonplaceholder.typicode.com/posts", method: "GET") { (result: Result<Array<Post>, Error>) in
            switch result {
            case .success(let posts):
                self.elements = posts
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = self.name
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.activityIndicator = activityIndicator
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        self.activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.activityIndicator.stopAnimating()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return elements.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell

        // Configure the cell...
        
//        if indexPath.row == 0 {
//            cell.wPost.textColor = UIColor.black
//            cell.wPost.font = UIFont(name: "Helvetica-Bold", size: 35)
//            cell.wPost.text = self.name
//            cell.wPost.topAnchor.constraint(equalToSystemSpacingBelow: self.tableView.topAnchor, multiplier: 10.0)
//        }
        
        cell.wPost.text = elements[indexPath.row].title.capitalizingFirstLetter()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tableViewController = DetailTableViewController(dataProvider: YoutubePostsDataProvider(post: elements[indexPath.row]))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            tableViewController.dataProvider = NetworkPostDataProvider(post: self.elements[indexPath.row])
        }
        self.navigationController?.pushViewController(tableViewController, animated: true)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
