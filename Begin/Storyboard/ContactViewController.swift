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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
          NotificationCenter.default.addObserver(self, selector: #selector(fetchingSuccess(notification:)), name: NSNotification.Name("success"), object: nil)
        
        tableView.dataSource = tableDataSource
        searchBar.delegate = self
        contcatApi.delegate = self
        
        settingGesture()
        
        contcatApi.checkForContactsPermission()
        
        tableDataSource.contacts.sort(by: {$0.lastName.lowercased() < $1.lastName.lowercased()})
        
      
    }
    
    
    @objc func fetchingSuccess(notification: Notification){
        
        print("++++++++++++++++++")
        print(notification.userInfo?["fetchContacts"])
    }
    
    // MARK: Gesture setUp
    func settingGesture()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture2))
        view.addGestureRecognizer(tap)
    }
    
    // Tap gesture
    @objc func tapGesture2()
    {
        view.endEditing(true)
    }
    
    
    @IBAction func unwindFromAddContactVC(_ sender: UIStoryboardSegue){
        
        if sender.source is addContactViewController{
            if let senderVC = sender.source as? addContactViewController{
                let newContact = Contact(/*profilePic: senderVC.profilePic,*/firstName: senderVC.firstName, lastName: senderVC.lastName, phoneNumber: senderVC.phoneNumber, emailId: senderVC.emailId)
                
                tableDataSource.contacts.append(newContact)
                tableDataSource.contacts.sort(by: {$0.lastName.lowercased() < $1.lastName.lowercased()})
                
                contcatApi.addContact(givenName: senderVC.firstName, familyName: senderVC.lastName, phoneNumber: senderVC.phoneNumber, emailId: senderVC.emailId)
                
                tableView.reloadData()
            }
        }
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


extension ContactViewController: ContactApiDelegate{
    
    func didReceivePermissionStatus(message: String) {
        print("didReceivePermissionStatus",message)
    }
    
    func didFetchContacts(fetchedContacts: [Contact]) {
        
        print("after recveing \(fetchedContacts.isEmpty)")
        tableDataSource.contacts = fetchedContacts
        
    }
}
