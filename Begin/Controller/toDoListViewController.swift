//
//  toDoListViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 17/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class toDoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func addTaskButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "addTask", sender: self)
    }
    
   
}
