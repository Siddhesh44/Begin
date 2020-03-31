//
//  userDefaultsViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 30/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class userDefaultsViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var welcomeMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let name = "Siddhesh"
        
        // saving value in userDefaults
        
//        UserDefaults.standard.set(name, forKey: "name")
//
//        if  let getName = UserDefaults.standard.string(forKey: "name"){
//            print(getName)
//        }
        
        //  getting value fro user Defaults
        if let currentUser = UserDefaults.standard.string(forKey: "User"){
                   welcomeMsg.text  = "Welcome Back \(currentUser)"
               }
        
    }
    
    //  saving value in user defaults
    @IBAction func saveInUserDefault(_ sender: UIButton) {
        let user = userName.text!
        UserDefaults.standard.set(user, forKey: "User")
        let currentUser = user
         welcomeMsg.text  = "Welcome \(currentUser)"
    }
    
    //  removing value from userDefaults
    @IBAction func removeFromUserDefaults(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "User")
        welcomeMsg.text  = "Welcome"
    }
}
