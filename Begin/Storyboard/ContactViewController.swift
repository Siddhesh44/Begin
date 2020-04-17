//
//  ContactViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 13/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import CoreData
import Contacts

class ContactViewController: UIViewController {
    
    var tableDataSource = tableViewDataSource()
    let contcatApi = ContactAPIHelper()
    
//    let store = CNContactStore()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = tableDataSource
        searchBar.delegate = self
        
        settingGesture()
        
        contcatApi.checkForContactsPermission()
        tableDataSource.contacts.sort(by: {$0.lastName.lowercased() < $1.lastName.lowercased()})
    }
    
    // MARK: Gesture setUp
    func settingGesture()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tap)
    }
    
    // Tap gesture
    @objc func tapGesture()
    {
        view.endEditing(true)
    }
    
    
    @IBAction func unwindFromAddContactVC(_ sender: UIStoryboardSegue){
        
        if sender.source is addContactViewController{
            if let senderVC = sender.source as? addContactViewController{
                let newContact = Contact(/*profilePic: senderVC.profilePic,*/firstName: senderVC.firstName, lastName: senderVC.lastName, phoneNumber: senderVC.phoneNumber, emailId: senderVC.emailId)
                
                tableDataSource.contacts.append(newContact)
                tableDataSource.contacts.sort(by: {$0.lastName.lowercased() < $1.lastName.lowercased()})
                tableView.reloadData()
                
                /*
                // saving contacts in contact api
                
                let saveContact = CNMutableContact()
                saveContact.givenName = senderVC.firstName
                saveContact.familyName = senderVC.lastName
                saveContact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberMain, value: CNPhoneNumber(stringValue: senderVC.phoneNumber))]
                saveContact.emailAddresses = [CNLabeledValue(label: CNLabelWork, value: senderVC.emailId as NSString)]
                
                let storeRequest = CNSaveRequest()
                storeRequest.add(saveContact, toContainerWithIdentifier: nil)
                do{
                    try contcatApi.store.execute(storeRequest)
                    print("contact saved successfully..")
                    tableView.reloadData()
                }
                catch let err{
                    print("failed to save Contact",err)
                }
 */
            }
        }
    }
    
    
    // MARK: fetching Contact
    
    /*
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
                self.fetchContact()
            }
            else{
                print("access denied")
            }
        }
    }
 */
    /*
    func fetchContact()
    {
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
                self.contacts.append(fethedContact)
                self.contacts.sort(by: {$0.lastName.lowercased() < $1.lastName.lowercased()})
                print("access fethedContact --")
            }
        } catch let err {
            print("failed to enumerate contacts..", err)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
 */
}


// MARK: searchBar Delegate
extension ContactViewController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
