//
//  toDoListViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 17/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import CoreData

// Refer to persistentContainer
let appDelegate = UIApplication.shared.delegate as! AppDelegate
// create a context from container.
let context = appDelegate.persistentContainer.viewContext
// create an entity and new records.
let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)
let TasksData = NSManagedObject(entity: entity!, insertInto: context)



let entity1 = NSEntityDescription.entity(forEntityName: "DoneTasks", in: context)
let CompletedTasksData = NSManagedObject(entity: entity1!, insertInto: context)


class toDoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // contains task data
    var tasks: [TaskModel] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // fetch tasks from dataModel
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                // add saved tasks from dataModel to tasks array on load
                if let savedTitle = data.value(forKey: "title") as? String,
                    let savedDesc = data.value(forKey: "desc") as? String,
                    let savedDate = data.value(forKey: "date") as? String{
                    
                    tasks.append(TaskModel(title: savedTitle, desc: savedDesc , date: savedDate))
                }
            }
            print("Fetching Tasks completed")
        } catch {
            print("Failed to Fetch Tasks")
        }
    }
    
    // receive newly added task
    @IBAction func unwindFromAddTask(_ sender:UIStoryboardSegue){
        if sender.source is addTaskViewController{
            if let senderVC = sender.source as? addTaskViewController
            {
                let task = TaskModel(title: senderVC.taskTitle, desc: senderVC.taskDesc, date: senderVC.taskDate)
                tasks.append(task)
                
                // add  task to  created record for each keys
                TasksData.setValue(senderVC.taskTitle, forKey: "title")
                TasksData.setValue(senderVC.taskDesc, forKey: "desc")
                TasksData.setValue(senderVC.taskDate, forKey: "date")
                
                do {
                    try context.save()
                    print("Saved New Tasks")
                } catch {
                    print("Failed saving new Tasks")
                }
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
        cell.showTasks(tasks: Task)
        return cell
    }
    
    // table row Swipe Action
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let Done = UIContextualAction(style: .destructive, title: "Done") {
            (action,view,nil) in
            print("Complete")
            
            // add completed task to completedTask array present in donetask.swift
            completedTask.append(self.tasks[indexPath.row])
            print("append done task to completedTask array")
            
            print(self.tasks[indexPath.row].title)
            // add  task to  created record for each keys
            CompletedTasksData.setValue(self.tasks[indexPath.row].title, forKey: "doneTitle")
            CompletedTasksData.setValue(self.tasks[indexPath.row].desc, forKey: "doneDesc")
            CompletedTasksData.setValue(self.tasks[indexPath.row].date, forKey: "doneDate")
            
            do {
                try context.save()
                print("Saved in dataModel")
            } catch {
                print("Failed saving")
            }
            // remove completed task from tasks array
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
