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


class toDoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // contains task data
    var tasks: [TaskModel] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // MARK: show old Task
        
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
        }catch {
            print(error)
        }
    }
    
    // MARK: receive newly added task
    @IBAction func unwindFromAddTask(_ sender:UIStoryboardSegue){
        
        let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)
        let TasksData = NSManagedObject(entity: entity!, insertInto: context)
        
        if sender.source is addTaskViewController{
            if let senderVC = sender.source as? addTaskViewController
            {
                let newTask = TaskModel(title: senderVC.taskTitle, desc: senderVC.taskDesc, date: senderVC.taskDate)
                tasks.append(newTask)
                
                // add  task to  created record for each keys
                TasksData.setValue(senderVC.taskTitle, forKey: "title")
                TasksData.setValue(senderVC.taskDesc, forKey: "desc")
                TasksData.setValue(senderVC.taskDate, forKey: "date")
                
                do {
                    try context.save()
                    tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    // go to Add New Task
    @IBAction func addTaskButton(_ sender: UIButton) {
        performSegue(withIdentifier: "addTask", sender: self)
    }
    
    // MARK: Table view Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse", for: indexPath) as! viewTaskTableViewCell
        
        let Task = tasks[indexPath.row]
        cell.showTasks(tasks: Task)
        return cell
    }
    
    // MARK: table row Swipe Action
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let entity1 = NSEntityDescription.entity(forEntityName: "DoneTasks", in: context)
        let CompletedTasksData = NSManagedObject(entity: entity1!, insertInto: context)
        
        // Completed Action on row swipe
        let Done = UIContextualAction(style: .destructive, title: "Done") {
            (action,view,nil) in
            
            // add completed task to completedTask array present in donetask.swift
            completedTask.append(self.tasks[indexPath.row])
            
            // add  task to  created record for each keys
            CompletedTasksData.setValue(self.tasks[indexPath.row].title, forKey: "doneTitle")
            CompletedTasksData.setValue(self.tasks[indexPath.row].desc, forKey: "doneDesc")
            CompletedTasksData.setValue(self.tasks[indexPath.row].date, forKey: "doneDate")
            do {
                try context.save()
            } catch {
                print(error)
            }
            // remove completed task from tasks array
            self.tasks.remove(at: indexPath.row)
            
            // remove completed task from dataModel
            let fetchToDelete = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
            fetchToDelete.returnsObjectsAsFaults = false
            
            do{
                let tasksFetched = try context.fetch(fetchToDelete)
                
                let taskToDelete = tasksFetched[indexPath.row] as! NSManagedObject
                context.delete(taskToDelete)
                
                do{
                    try context.save()
                }
                catch{
                    print(error)
                }
            }
            catch{
                print(error)
            }
            
            tableView.reloadData()
        }
        
        //   Delete Action on row Swipe
        let Delete = UIContextualAction(style: .destructive, title: "Delete") {
            (action,view,nil) in
            self.tasks.remove(at: indexPath.row)
            
            let fetchToDelete = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
            fetchToDelete.returnsObjectsAsFaults = false
            
            do{
                let tasksFetched = try context.fetch(fetchToDelete)
                
                let taskToDelete = tasksFetched[indexPath.row] as! NSManagedObject
                context.delete(taskToDelete)
                
                do{
                    try context.save()
                }
                catch{
                    print(error)
                }
            }
            catch{
                print(error)
            }
            tableView.reloadData()
        }
        Done.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        //Done.title = "Done"
        Done.image = #imageLiteral(resourceName: "correct 128.png")
        Delete.image = #imageLiteral(resourceName: "trash 128")
        
        let config = UISwipeActionsConfiguration(actions: [Delete,Done])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    
}
