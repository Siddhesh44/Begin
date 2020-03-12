//
//  ViewController.swift
//  Begin
//
//  Created by Infiny Webcom on 06/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userNameText = ""
    
  
    @IBOutlet weak var User: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func userLogin(_ sender: Any) {
        
        self.userNameText = User.text!
        
        performSegue(withIdentifier: "UserName", sender: self)
 
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DataViewController
        
     
        vc.finalName = self.userNameText
            
    }
    
   
}

