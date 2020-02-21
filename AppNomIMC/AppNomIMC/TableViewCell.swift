//
//  TableViewCell.swift
//  AppNomIMC
//
//  Created by Tecnologico Roque on 2/20/20.
//  Copyright © 2020 Tecnologico Roque. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbnom: UILabel!
    
    @IBOutlet weak var lbimc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
