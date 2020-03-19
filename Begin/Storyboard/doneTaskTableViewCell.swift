//
//  doneTaskTableViewCell.swift
//  Begin
//
//  Created by Siddhesh jadhav on 19/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class doneTaskTableViewCell: UITableViewCell {

   
    @IBOutlet weak var cTitle: UILabel!
    @IBOutlet weak var cDesc: UILabel!
    @IBOutlet weak var cDate: UILabel!
    
    func tasksData(tasks:TaskModel)
       {
           cTitle.text = tasks.title
           cDesc.text = tasks.desc
           cDate.text = tasks.date
       }
}
