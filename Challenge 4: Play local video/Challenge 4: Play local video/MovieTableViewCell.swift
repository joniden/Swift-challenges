//
//  MovieTableViewCell.swift
//  Challenge 4: Play local video
//
//  Created by Joacim Nidén on 25/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var printScreen: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    
    
}
