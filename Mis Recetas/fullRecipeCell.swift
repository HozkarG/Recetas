//
//  fullRecipeCell.swift
//  Mis Recetas
//
//  Created by Oscar G. Solares on 7/3/17.
//  Copyright © 2017 Solde. All rights reserved.
//

import UIKit

class fullRecipeCell: UITableViewCell {

    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var lblFullLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
