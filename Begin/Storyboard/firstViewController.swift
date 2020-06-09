//
//  firstViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 15/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

protocol dataDelegate: class {
    func passData(textFieldData: String)
}
class firstViewController: UIViewController {
    
    @IBOutlet weak var txt: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    var delegate: dataDelegate?
    
    var seond = secondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        seond.delgate1 = self
        seond.abc()
    }
    
    @IBAction func clicked(_ sender: UIButton) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeScreenVC = storyBoard.instantiateViewController(withIdentifier: "second") as! secondViewController
        homeScreenVC.labelText = "hello"
        self.navigationController?.pushViewController(homeScreenVC, animated: true)
    }
    
    
}

extension firstViewController: getDataFromSecondViewController{
    func getDataFrom(text: String) {
        print(text)
    }
    
    
}
