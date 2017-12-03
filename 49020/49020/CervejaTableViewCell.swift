//
//  CervejaTableViewCell.swift
//  49020
//
//  Created by macos on 03/12/17.
//  Copyright © 2017 meire. All rights reserved.
//

import UIKit

class CervejaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblTeor: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
