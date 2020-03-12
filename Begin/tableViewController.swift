//
//  tableViewController.swift
//  Begin
//
//  Created by Infiny Webcom on 11/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
   
    @IBOutlet weak var tableView: UITableView!
    
   var sections = ["A","B","C","D"]
    var items = [["Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, search engine, cloud computing, software, and hardware. ","A2"],["B1","B2","B3"],["C1","C2","C3"],["D1","D2","D3"]]

    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 60
//        tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    // to count rows in section
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    // create the actual table view cells
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse") as! customTableViewCell
       
        cell.label.text = items[indexPath.section][indexPath.row]
        return cell
        
    }
    
    // MARK: Table View Delegate
   
    // MARK: Adding Header

     func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
//            let vw = UIView()
//            vw.backgroundColor = UIColor.red
//            return vw
        return sections[section]
    }
    
    // MARK: Color For Header
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.red
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    
    // MARK: Alert
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Hint", message: "you are on \(items[indexPath.section][indexPath.row]) row" , preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController,animated: true,completion: nil)
    }
    
    
}
