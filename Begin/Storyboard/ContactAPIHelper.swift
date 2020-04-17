//
//  ContactAPIHelper.swift
//  Begin
//
//  Created by Siddhesh jadhav on 16/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import Contacts

class ContactAPIHelper{
    
    let store = CNContactStore()
    
    func checkForContactsPermission()
    {
        print("Attempt to fetch Contacts....")
        
        
        // checking or requesting access
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err{
                print("falied to request access",err)
                return
            }
            if granted  {
                print("access granted")
               // self.fetchContact()
            }
            else{
                print("access denied")
            }
        }
    }
    
   /*
    func fetchContact()
    {
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey,CNContactEmailAddressesKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        do {
            try store.enumerateContacts(with: request) { (contact, stopPointerIfYouWantTOStopEnumerating) in
                
                print("access contact.givenName \(contact.givenName)")
                let givenName = contact.givenName
                let familyName = contact.familyName
                let phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? "no number found"
                let email = contact.emailAddresses.first?.value ?? "no email found"
                
                let fethedContact = Contact(firstName: givenName, lastName: familyName, phoneNumber: phoneNumber, emailId: email as String)
                contaccontacts.append(fethedContact)
                contacts.sort(by: {$0.lastName.lowercased() < $1.lastName.lowercased()})
                print("access fethedContact --")
            }
        } catch let err {
            print("failed to enumerate contacts..", err)
        }
        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }
 */
    
    
    
}
