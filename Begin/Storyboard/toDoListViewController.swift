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
    
    
    
    // table row Swipe Action
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let Done = UIContextualAction(style: .destructive, title: "Done") {
            (action,view,nil) in
            print("Complete")
           
            doneTask.append(self.tasks[indexPath.row])
            
            taskManger.getTask()
            
            
            let a = self.tasks[indexPath.row].title
            print(a)

            self.tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        Done.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        Done.title = "Done"
        Done.image = #imageLiteral(resourceName: "icons8-checkmark-16")
       
        let config = UISwipeActionsConfiguration(actions: [Done])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
   
    

}
