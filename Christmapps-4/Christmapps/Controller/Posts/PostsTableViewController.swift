//
//  PostsTableViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import UIKit

struct PostProvider {
    
    var posts: [Post]
    
    init(posts: [Post]) {
        self.posts = posts
    }
    
    func rows() -> Int {
        return posts.count
    }
    
    func postTitle(index: Int) -> String {
        return posts[index].title
    }
}

class PostsTableViewController: UITableViewController {

    // MARK: - Properties
    private(set) var dataRetriever: DataRetriever!
    private var activityIndicator = UIActivityIndicatorView(style: .medium)
    private var provider = PostProvider(posts: [])
    let filtered = PostsFilteredTableViewController()
    private lazy var searchController: UISearchController = {
        let s = UISearchController(searchResultsController: filtered)
        s.searchResultsUpdater = self
        return s
    }()
    
    // MARK: - Life cycle
    init(dataRetriever: DataRetriever) {
        self.dataRetriever = dataRetriever
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBarButton = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItem = rightBarButton
        
        title = "Posts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        
        tableView.separatorInset = .zero
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
          
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        dataRetriever.retrieve(url: "https://jsonplaceholder.typicode.com/posts", method: "GET") { (result: Result<Array<Post>, Error>) in
            switch result {
            case .success(let posts):
                Thread.executeInMain {
                    self.provider.posts = posts
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            case  .failure(let error):
                print(error)
            }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provider.rows()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//        cell.textLabel?.text = provider.postTitle(index: indexPath.row)
        switch provider.posts[indexPath.row].userId {
        case .int(let uid):
            cell.textLabel?.text = "\(uid)"
        case .string(let uid):
            cell.textLabel?.text = uid
        case .undefined:
            cell.textLabel?.text = "UNDEFINED"
        }
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension PostsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
        filtered.posts = provider.posts.filter{ $0.title.lowercased().starts(with: searchController.searchBar.text!.lowercased()) }
    }
}

extension PostsTableViewController {
    func header() -> UIView {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
        v.backgroundColor = .red
        
        let img = UIImageView()
        img.backgroundColor = .blue
        img.translatesAutoresizingMaskIntoConstraints = false
        
        v.addSubview(img)
        
        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            img.topAnchor.constraint(equalTo: v.topAnchor, constant: 20),
            img.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
            img.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -20)
        
        
        ])
        
        
        return v
    }
}
