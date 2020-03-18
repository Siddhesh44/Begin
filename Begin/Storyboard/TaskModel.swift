//
//  TaskModel.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

struct TaskModel {
    let title: String
    let desc: String
    let date: String
    
    init(title:String,desc:String,date:String) {
        self.title = title
        self.desc = desc
        self.date = date
    }
}
