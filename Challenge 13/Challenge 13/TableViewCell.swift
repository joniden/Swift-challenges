//
//  TableViewCell.swift
//  Challenge 13
//
//  Created by Joacim Nidén on 05/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var cellTitle: UILabel!    
    @IBOutlet weak var cellBody: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    

}
