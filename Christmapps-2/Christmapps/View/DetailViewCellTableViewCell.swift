//
//  DetailViewCellTableViewCell.swift
//  Christmapps
//
//  Created by user on 07/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

class DetailViewCellTableViewCell: UITableViewCell {

    @IBOutlet var atributo1: UILabel!
    
    @IBOutlet var atributo2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
