//
//  TableViewCell.swift
//  Christmapps
//
//  Created by user on 03/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var wPost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
