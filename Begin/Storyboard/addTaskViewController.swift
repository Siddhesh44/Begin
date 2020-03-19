//
//  addTaskViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 17/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController,UITextFieldDelegate {

    
    var taskTitle: String!
    var taskDesc:  String!
    var taskDate:  String!
    
    
    @IBOutlet weak var tTitle: UITextField!
   
    @IBOutlet weak var tDesc: UITextField!
    @IBOutlet weak var tDate: UITextField!
     @IBOutlet weak var addTaskButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        tTitle.delegate = self
        tDesc.delegate = self
        tDate.delegate = self
        
        
        
        // display date on load
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        tDate.text = formatter.string(from: Date())
        
        // disable add button
        addTaskButton.isEnabled = false
    }
    
// back to ToDo List
    @IBAction func cancelTaskButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    // hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
       
    // disable and enable add button
    func textFieldDidEndEditing(_ textField: UITextField) {
        if tTitle.text!.isEmpty || tDesc.text!.isEmpty
         {
              addTaskButton.isEnabled = false
         }
        else
        {
            addTaskButton.isEnabled = true
        }
    }
             
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let newTitle = tTitle.text,let newDesc = tDesc.text,let newDate = tDate.text{
            
            taskTitle = newTitle
            taskDesc = newDesc
            taskDate = newDate
              
        }
      
    }
     
}


