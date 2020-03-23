//
//  viewTaskTableViewCell.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class viewTaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showTitle: UILabel!
    
    @IBOutlet weak var showDesc: UILabel!
    
    @IBOutlet weak var showDate: UILabel!
    
    func showTasks(tasks:TaskModel)
    {
        showTitle.text = tasks.title
        showDesc.text = tasks.desc
        showDate.text = tasks.date
    }
    
}
