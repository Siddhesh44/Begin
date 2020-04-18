//
//  ContactAPIHelper.swift
//  Begin
//
//  Created by Siddhesh jadhav on 16/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import Contacts

protocol ContactApiDelegate: class {
    func didReceivePermissionStatus(message: String)
    func didFetchContacts(fetchedContacts: [Contact])
}

class ContactAPIHelper{
    
    let store = CNContactStore()
    weak var delegate: ContactApiDelegate?
    
    var fetchedContact = [Contact]()
    
    func checkForContactsPermission()
    {
        print("Attempt to fetch Contacts....")
        
        
        // checking or requesting access
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err{
                self.delegate?.didReceivePermissionStatus(message: "falied to request access: \(err)")
                // print("falied to request access",err)
                return
            }
            if granted  {
                
                self.delegate?.didReceivePermissionStatus(message: "access granted")
                self.fetchContact()
                print("at a time of passing: \(self.fetchedContact.isEmpty)")
                self.delegate?.didFetchContacts(fetchedContacts: self.fetchedContact)
                
            }
            else{
                
                self.delegate?.didReceivePermissionStatus(message: "access denied")
                
            }
        }
    }
    
    
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
                
                let fetchContact = Contact(firstName: givenName, lastName: familyName, phoneNumber: phoneNumber, emailId: email as String)
                
                self.fetchedContact.append(fetchContact)
                print("after appending:\(self.fetchedContact.isEmpty)")
                print("access fethedContact --")
            }
        } catch let err {
            print("failed to enumerate contacts..", err)
        }
    }
    
    func addContact(givenName: String,familyName: String,phoneNumber: String, emailId: String)
    {
        // saving contacts in contact api
        
        let saveContact = CNMutableContact()
        saveContact.givenName = givenName
        saveContact.familyName = familyName
        saveContact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberMain, value: CNPhoneNumber(stringValue: phoneNumber))]
        saveContact.emailAddresses = [CNLabeledValue(label: CNLabelWork, value: emailId as NSString)]
        
        let storeRequest = CNSaveRequest()
        storeRequest.add(saveContact, toContainerWithIdentifier: nil)
        do{
            try store.execute(storeRequest)
            print("contact saved successfully..")
        }
        catch let err{
            print("failed to save Contact",err)
        }
        
    }
    
}
