//
//  tableViewDataSource.swift
//  Begin
//
//  Created by Siddhesh jadhav on 17/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class tableViewDataSource: NSObject,UITableViewDataSource {
    
     var contacts:[Contact] = []

    func numberOfSections(in tableView: UITableView) -> Int {
           1
       }
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return contacts.count
       }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           let cell = tableView.dequeueReusableCell(withIdentifier: "showContact", for: indexPath) as! showContactsCell

           cell.setContact(contact: contacts[indexPath.row])
           return cell
       }
    
}
