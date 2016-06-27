//
//  PratosCell.swift
//  universitariosFamintos
//
//  Created by Student on 6/27/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class PratosCell: UITableViewCell {

    @IBOutlet weak var plateImage: UIImageView!
    
    @IBOutlet weak var plateName: UILabel!
    
    @IBOutlet weak var qtd: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
