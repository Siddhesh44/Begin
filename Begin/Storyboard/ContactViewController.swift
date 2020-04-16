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

// Refer to persistentContainer
let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
// create a context from container.
let context1 = appDelegate.persistentContainer.viewContext

class ContactViewController: UIViewController {
    
    var contacts:[Contact] = []
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: setting delegates
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        settingGesture()
        
        //fetch contacts from data model
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                // add saved contacts from dataModel to contacts array on load
                if  /*let savedProfilePic = data.value(forKey: "profilePic") as? UIImage,*/
                    let savedFirstName = data.value(forKey: "firstName") as? String,
                    let savedLastName = data.value(forKey: "lastName") as? String,
                    let savedPhoneNumber = data.value(forKey: "phoneNumber") as? String,
                    let savedEmailId = data.value(forKey: "emailId") as? String{
                    
                    contacts.append(Contact(/*profilePic: savedProfilePic,*/firstName: savedFirstName, lastName: savedLastName, phoneNumber: savedPhoneNumber, emailId: savedEmailId))
                }
            }
        }catch {
            print(error)
        }
        
        fetchContacts()
        contacts.sort(by: {$0.lastName < $1.lastName})
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
        
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        let contactsData = NSManagedObject(entity: entity!, insertInto: context)
        
        if sender.source is addContactViewController{
            if let senderVC = sender.source as? addContactViewController{
                let newContact = Contact(/*profilePic: senderVC.profilePic,*/firstName: senderVC.firstName, lastName: senderVC.lastName, phoneNumber: senderVC.phoneNumber, emailId: senderVC.emailId)
                
                contacts.append(newContact)
                contacts.sort(by: {$0.lastName < $1.lastName})
                
                //let imageInPNGFormat = senderVC.profilePic.pngData()
                // print("image in png format \(imageInPNGFormat!)")
                // saving new task data into data model
                // contactsData.setValue(imageInPNGFormat, forKey: "profilePic")
                contactsData.setValue(senderVC.firstName, forKey: "firstName")
                contactsData.setValue(senderVC.lastName, forKey: "lastName")
                contactsData.setValue(senderVC.phoneNumber, forKey: "phoneNumber")
                contactsData.setValue(senderVC.emailId, forKey: "emailId")
                
                do {
                    try context.save()
                    tableView.reloadData()
                } catch {
                    print(error)
                }
                
            }
        }
    }
    
    // MARK: fetching Contact
    
    func fetchContacts()
    {
        print("Attempt to fetch Contacts....")
        
        let store = CNContactStore()
        
        // checking or requesting access
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err{
                print("falied to request access",err)
                return
            }
            
            if granted  {
                
                print("access granted")
                
                let keys = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey,CNContactEmailAddressesKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    try store.enumerateContacts(with: request) { (contact, stopPointerIfYouWantTOStopEnumerating) in
                        let givenName = contact.givenName
                        let familyName = contact.familyName
                        let phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? "no number found"
                        let email = contact.emailAddresses.first?.value ?? "no email found"
                        
                        let fethedContact = Contact(firstName: givenName, lastName: familyName, phoneNumber: phoneNumber, emailId: email as String)
                        self.contacts.append(fethedContact)
                        self.contacts.sort(by: {$0.lastName < $1.lastName})
                        
                    }
                } catch let err {
                    print("failed to enumerate contacts..", err)
                }
                
                
            }
            else{
                print("access denied")
            }
        }
    }
    
}

// MARK: table View Delegate
extension ContactViewController: UITableViewDelegate,UITableViewDataSource{
    
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
