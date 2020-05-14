//
//  OrdCellTableViewCell.swift
//  MinLexinApp
//
//  Created by Shamo Zahidov on 2020-05-07.
//  Copyright © 2020 Shamo Zahidov. All rights reserved.
//

import UIKit

class OrdCellTableViewCell: UITableViewCell {

    @IBOutlet weak var engelskaLabel: UILabel!
    
    @IBOutlet weak var svenskaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
