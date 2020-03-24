//
//  doneTaskTableViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 19/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import CoreData

var completedTask: [TaskModel] = []
class doneTaskTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchingCompletedTask()
        tableView.reloadData()
        print("reload")
    }
    
    
    @IBAction func clearCompletedTasksButton(_ sender: Any) {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "DoneTasks")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
        completedTask = []
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return completedTask.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse", for: indexPath) as! doneTaskTableViewCell
        
        let Task = completedTask[indexPath.row]
        cell.tasksData(tasks: Task)
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        print("re-load on appear")
    }
    
    // MARK: Fetch Completed Task
    func fetchingCompletedTask()
    {
        // fetch completd task from dataModel
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DoneTasks")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                // add fetched task from dataModel to taskDone array
                if  let completedTaskTitle = data.value(forKey: "doneTitle") as? String,
                    let completedTaskDesc = data.value(forKey: "doneDesc") as? String,
                    let completedTaskDate = data.value(forKey: "doneDate") as? String{
                    
                    completedTask.append(TaskModel(title: completedTaskTitle, desc: completedTaskDesc , date: completedTaskDate))
                    print("append complted task to dataModel")
                }
            }
            print("done featching completed task")
        } catch {
            print("Failed")
        }
    }
}
