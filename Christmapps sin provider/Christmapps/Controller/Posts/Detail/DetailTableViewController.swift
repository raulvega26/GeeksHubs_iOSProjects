//
//  DetailTableViewController.swift
//  Christmapps
//
//  Created by user on 07/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
      
    var posts : Post!
    var numberSection = 2
    var postId: Int
    var numberCells = 0
    
    let title_elements = ["ID","ID Usuario","Título","Cuerpo"]
    let title_comments = ["ID Post","ID","Nombre","Email","Cuerpo"]
    var text_elements = [String]()
    var text_comments = [Comment]()
    
    init(dataRetriever: DataRetriever, post_s: Post, postId: Int) {
        self.dataRetriever = dataRetriever
        self.postId = postId
        self.posts = post_s
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        self.posts = Post(userId: 1,id: 1,title: "aloha",body: "aloha hoja")
        self.postId = 1
        super.init(coder: coder)
    }
    
    // MARK: - Properties
    private(set) var dataRetriever: DataRetriever!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // (result: Result<Array<Post>, Error>)
        dataRetriever.retrieve(url: "http://jsonplaceholder.typicode.com/posts/1/comments?postId=\(self.postId)", method: "GET") { (result: Result<Array<Comment>, Error>) in
            switch result {
            case .success(let comments):
                self.text_comments = comments
                print(comments)
                
                DispatchQueue.main.async {
                    self.numberSection += self.text_comments.count
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
                break
            }
        }
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
        self.title = title()
        
        text_elements.append("\(posts.id)")
        text_elements.append("\(posts.userId)")
        text_elements.append(posts.title)
        text_elements.append(posts.body)
        
        self.numberCells = self.title_elements.count
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberSection
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section > 1) { return title_comments.count }
        else { return title_elements.count }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return "Información del POST \(section+1)"
    }

    // Create a standard footer that includes the returned text.
    override func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
        return "Esta es la \(section+1)a sección"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DetailTableViewCell
        
        if indexPath.section > 1 {
            cell.leftLabel.text = title_comments[indexPath.row]
            let section = indexPath.section-2
            let val = text_comments[section].value(at: indexPath.row)
            cell.rightLabel.text = "\(val)"
        } else {
            cell.leftLabel?.text = title_elements[indexPath.row]
            cell.rightLabel?.text = text_elements[indexPath.row]
        }
        
//        if (indexPath.section > 1) {
//            cell.leftLabel.text = title_comments[indexPath.row]
//            cell.rightLabel.text = "\(text_comments[indexPath.row])"
//        } else {
//            cell.backgroundColor = .white
//            if (indexPath.section == 1) {
//                cell.backgroundColor = UIColor(red:CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
//            }
//            
//            cell.leftLabel?.text = title_elements[indexPath.row]
//            cell.rightLabel?.text = text_elements[indexPath.row]
//        }
        
        
        return cell
    }

    func title() -> String? {
      if posts.title.count > 20 {
        return String(posts.title.prefix(20) + "...")
      }
      return posts.title
    }
    
}
