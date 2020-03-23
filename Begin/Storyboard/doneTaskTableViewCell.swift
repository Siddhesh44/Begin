//
//  doneTaskTableViewCell.swift
//  Begin
//
//  Created by Siddhesh jadhav on 19/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class doneTaskTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var completedTitle: UILabel!
    @IBOutlet weak var completedDesc: UILabel!
    @IBOutlet weak var completedDate: UILabel!
    
    func tasksData(tasks:TaskModel)
    {
        completedTitle.text = tasks.title
        completedDesc.text = tasks.desc
        completedDate.text = tasks.date
    }
}
