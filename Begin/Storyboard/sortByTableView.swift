//
//  sortByTableView.swift
//  Begin
//
//  Created by Siddhesh jadhav on 04/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class sortByTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
        
    var sortOption = barberShopFilterVC()
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortByList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "sortByCell", for: indexPath) as! sortCell
        cell.setList(listItem: sortByList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Selected:- \(sortByList[indexPath.row].sortList)")
        
        print(sortOption.selectedSortPattern)
        sortOption.selectedSortPattern = sortByList[indexPath.row].sortList
        print(sortOption.selectedSortPattern)
        
        let cell = self.cellForRow(at: indexPath) as! sortCell
        cell.listLbl.textColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
        cell.accessoryType = .checkmark
        cell.tintColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("DeSelected:- \(sortByList[indexPath.row].sortList)")
        
        let cell = self.cellForRow(at: indexPath) as! sortCell
        cell.listLbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        cell.accessoryType = .none
    }
    
}
