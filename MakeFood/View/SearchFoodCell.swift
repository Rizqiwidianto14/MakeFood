//
//  SearchFoodCell.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import UIKit

class SearchFoodCell: UITableViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
