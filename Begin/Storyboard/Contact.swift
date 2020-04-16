//
//  Contact.swift
//  Begin
//
//  Created by Siddhesh jadhav on 14/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

class Contact{
    
   // var profilePic: UIImage
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var emailId: String
    
    init(/*profilePic: UIImage,*/firstName: String,lastName: String,phoneNumber: String,emailId: String) {
        
        //self.profilePic = profilePic
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.emailId = emailId
    }
    
}
