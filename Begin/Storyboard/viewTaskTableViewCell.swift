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
 
    var tasksData: TaskModel?
    {
        didSet{
            vtTitleLabel.text = tasksData?.title
            vtDescLabel.text = tasksData?.desc
        }
    }
    
}
