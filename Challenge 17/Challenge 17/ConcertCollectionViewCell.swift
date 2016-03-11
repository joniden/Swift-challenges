//
//  ConcertCollectionViewCell.swift
//  Challenge 17
//
//  Created by Joacim Nidén on 10/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ConcertCollectionViewCell: UICollectionViewCell {
    
    //MARK: Public
    var concert: Concert! {
        didSet{
            updateUI()
        }
    }
    
    //MARK: - Private
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var ConcertTitleLabel: UILabel!
    
    private func updateUI() {
        ConcertTitleLabel?.text! = concert.title
        featuredImageView?.image! = concert.featuredImage
    }
}
