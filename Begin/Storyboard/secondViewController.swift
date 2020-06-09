//
//  secondViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 15/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

protocol getDataFromSecondViewController: class {
    func getDataFrom(text: String)
}
class secondViewController: UIViewController {
    
//    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var dismissBtn: UIButton!
    
    weak var delgate1: getDataFromSecondViewController?
    
  //  var getData = firstViewController()
    var labelText: String = ""
    var data: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // getData.delegate = self
        
        print(labelText)
        
    }
    
    func abc(){
        self.delgate1?.getDataFrom(text: "Siddhesh")
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension secondViewController: dataDelegate{
    func passData(textFieldData: String) {
        data = textFieldData
        print(data)
    }
    
    
}
