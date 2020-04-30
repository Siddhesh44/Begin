//
//  servicesTableView.swift
//  Begin
//
//  Created by Siddhesh jadhav on 27/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class servicesTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "servicesCell", for: indexPath) as! servicesCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! shopCell
            return cell
        }
    }
}
