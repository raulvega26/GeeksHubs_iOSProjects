//
//  DetailTableViewController.swift
//  Christmapps
//
//  Created by user on 07/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

struct Section {
    var header: String
    var footer: String
    var rows: [Row]
}

struct Row {
    var title: String
    var value: String
    var bgColor: UIColor = .white
    
    init(title: String,
         value: String,
         bgColor: UIColor = .white) {
        self.title = title
        self.value = value
        self.bgColor = bgColor
    }
}

class DetailTableViewController: UITableViewController {
      
    var dataProvider: PostDataProvider! {
        didSet {
            tableView.reloadData()
        }
    }
    private var content = [Section]()
    
    init(dataProvider: PostDataProvider) {
        self.dataProvider = dataProvider
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
//        let section1 = [
//            Row(title: "ID", value: "\(post.id)"),
//            Row(title: "ID Usuario", value: String(post.userId)),
//            Row(title: "Título", value: post.title),
//            Row(title: "Cuerpo", value: post.body),
//        ]
//        let section2 = [
//            Row(title: "ID", value: "\(post.id)", bgColor: .red),
//            Row(title: "ID Usuario", value: String(post.userId)),
//            Row(title: "Título", value: post.title),
//            Row(title: "Cuerpo", value: post.body),
//        ]
//        content.append(Section(header: "Titulo 1", footer: "Footer 1", rows: section1))
//        content.append(Section(header: "Titulo 2", footer: "Footer 2", rows: section2))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.sections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.rows(at: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return dataProvider.header(for: section)
    }

    // Create a standard footer that includes the returned text.
    override func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
        return dataProvider.footer(for: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DetailTableViewCell
        let contentModel = dataProvider.row(at: indexPath)
        cell.textLabel?.text = contentModel.title
        cell.detailTextLabel?.text = contentModel.value
        cell.contentView.backgroundColor = contentModel.bgColor
//        var text: String
//        text = String (text_elements[indexPath.row])
        
//        cell.detailTextLabel?.text =  text

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
