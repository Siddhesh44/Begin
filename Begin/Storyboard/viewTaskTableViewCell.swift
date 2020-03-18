//
//  viewTaskTableViewCell.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class viewTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var vtTitleLabel: UILabel!
    
    @IBOutlet weak var vtDescLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
