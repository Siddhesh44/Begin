//
//  toDoListViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 17/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class toDoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    var tasks: [TaskModel] = []
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    @IBAction func unwindFromAddTask(_ sender:UIStoryboardSegue){
        if sender.source is addTaskViewController{
            if let senderVC = sender.source as? addTaskViewController
            {
              
                let task = TaskModel(title: senderVC.taskTitle, desc: senderVC.taskDesc, date: senderVC.taskDate)
               tasks.append(task)
            }
            tableView.reloadData()
        }
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
       
        let Task = tasks[indexPath.row]
        cell.tasksData(tasks: Task)
        return cell
    }
    
    
    
    
    
}
