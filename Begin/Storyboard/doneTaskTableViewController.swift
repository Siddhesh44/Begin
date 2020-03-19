//
//  doneTaskTableViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 19/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

 var taskDone: [TaskModel] = []
class doneTaskTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskDone.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse", for: indexPath) as! doneTaskTableViewCell
        
          let Task = taskDone[indexPath.row]
               cell.tasksData(tasks: Task)
           return cell
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}
