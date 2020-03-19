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
 
    @IBOutlet weak var vtDateLabel: UILabel!
    
    func tasksData(tasks:TaskModel)
    {
        vtTitleLabel.text = tasks.title
        vtDescLabel.text = tasks.desc
        vtDateLabel.text = tasks.date
    }
   
}
