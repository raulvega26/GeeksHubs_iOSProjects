//
//  DetailTableViewController.swift
//  Christmapps
//
//  Created by user on 04/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var post: Post!
    let tittles = ["ID", "ID Usuario", "Título", "Cuerpo"]
    var values = [String]()
    
    init(post_s: Post) {
        self.post = post_s
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = self.post.title.uppercased()
        
        tableView.register(UINib(nibName: "DetailViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        
        let stringValue = "\(post.id)"
        values.append(stringValue)
        let stringValue2 = "\(post.userId)"
        values.append(stringValue2)
        values.append(post.title.firstUppercased)
        values.append(post.body.firstUppercased)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tittles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DetailViewCellTableViewCell
        
        cell.atributo1.text = tittles[indexPath.row]
        cell.atributo2.text = values[indexPath.row]
        
        if(indexPath.section == 1){
            cell.backgroundColor = getRandomColor()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Información del POST \(section+1)"
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if(section == 0){
           return "Esta es la primera sección"
        }else if (section == 1){
           return "Esta es la segunda sección"
        }
        return "none"
    }
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
