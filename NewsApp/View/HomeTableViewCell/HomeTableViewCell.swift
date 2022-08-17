//
//  HomeTableViewCell.swift
//  NewsApp
//
//  Created by Narkoz on 17.08.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet var imageViewCell: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
