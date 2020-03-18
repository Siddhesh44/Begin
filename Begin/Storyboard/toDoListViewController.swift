//
//  toDoListViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 17/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class toDoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    var tasks = [TaskModel]()
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tasks = addTaskViewController.addTask()
    }
    
    // go to Add New Task
    @IBAction func addTaskButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "addTask", sender: self)
    }
    

   
    // Table view Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse", for: indexPath) as! viewTaskTableViewCell
       
        cell.tasksData = tasks[indexPath.row]
        return cell
    }
    
    
    
    
    
}
