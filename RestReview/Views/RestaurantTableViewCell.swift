//
//  RestaurantTableViewCell.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/25/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var distantLabel: UILabel!
     @IBOutlet weak var restaurantLabel: UILabel!
     @IBOutlet weak var distantIcon: UIImageView!
     
    @IBOutlet weak var restaurantImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
