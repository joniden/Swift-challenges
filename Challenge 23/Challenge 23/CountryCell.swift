//
//  CountryCell.swift
//  Challenge 23
//
//  Created by Joacim Nidén on 04/04/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var country: Country?{
        didSet {
            if let item = country {
                headerLabel.text = item.continent.toString()
                headerLabel.textColor = item.continent.toColor()
                contentLabel.text = item.summary
            }else{
                headerLabel.text = nil
                contentLabel.text = nil
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
