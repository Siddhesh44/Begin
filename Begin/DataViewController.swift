//
//  DataViewController.swift
//  Begin
//
//  Created by Infiny Webcom on 06/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    var finalName = ""
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
               nameLabel.text = "Welcome" + finalName
        
        print(finalName)
        // Do any additional setup after loading the view.
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
