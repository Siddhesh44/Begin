//
//  showContactsCell.swift
//  Begin
//
//  Created by Siddhesh jadhav on 14/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class showContactsCell: UITableViewCell {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    func setContact(contact: Contact){
        
        //profilePic.image = contact.profilePic
        firstName.text = contact.firstName
        lastName.text = contact.lastName
        phoneNumber.text = String(contact.phoneNumber)
    }
}
