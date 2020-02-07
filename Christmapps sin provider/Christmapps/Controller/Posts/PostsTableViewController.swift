//
//  PostsTableViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    var commentsRetriever = URLSessionDataRetriever()
    var elements = [Post]()
    var name: String
    
    var filteredPosts = [Post]()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
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

        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Posts"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
        self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.activityIndicator.hidesWhenStopped = true
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        self.activityIndicator.startAnimating()
        
        /* http://jsonplaceholder.typicode.com/posts/1/comments */
        
        URLSessionDataRetriever().retrieve(url: "https://jsonplaceholder.typicode.com/posts", method: "GET") { (result: Result<Array<Post>, Error>) in
            switch result {
            case .success(let posts):
                self.elements = posts
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = self.name
        
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isFiltering {
            return filteredPosts.count
        }
        return elements.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell

        // Configure the cell...
        
        if isFiltering {
            cell.wPost.text = filteredPosts[indexPath.row].title.capitalizingFirstLetter()
        } else {

            cell.wPost.text = elements[indexPath.row].title.capitalizingFirstLetter()
        }
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tableViewController = DetailTableViewController(dataRetriever: dataRetriever, post_s: elements[indexPath.row], postId: indexPath.row+1)
        self.navigationController?.pushViewController(tableViewController, animated: true)
    }
    
    func filterContentForSearchText(_ searchText: String,
                                    category: Post? = nil) {
        filteredPosts = elements.filter { (post: Post) -> Bool in
                return post.title.lowercased().contains(searchText.lowercased())
        }

        tableView.reloadData()
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


extension PostsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

