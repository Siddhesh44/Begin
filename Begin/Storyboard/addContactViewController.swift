//
//  addContactViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 13/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class addContactViewController: UIViewController {
    
    @IBOutlet weak var setProfileImage: UIImageView!
    @IBOutlet weak var setFirstName: UITextField!
    @IBOutlet weak var setLastName: UITextField!
    @IBOutlet weak var setPhoneNumber: UITextField!
    @IBOutlet weak var setEmail: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var addProfilePicLbl: UILabel!
    
    var profilePic: UIImage!
    var firstName: String!
    var lastName: String!
    var phoneNumber: String!
    var emailId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: setting delegates
        setFirstName.delegate = self
        setLastName.delegate = self
        setPhoneNumber.delegate = self
        setEmail.delegate = self
        
        settingUpGesture1()
        
        self.managingKeyBoard()
        
        imageView.roundedImage()

    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Gesture Setup
    func settingUpGesture1()
    {
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(selectProfilePic))
        imageView.addGestureRecognizer(imageTap)

        let addImageLblTap = UITapGestureRecognizer(target: self, action: #selector(selectProfilePic))
        addProfilePicLbl.addGestureRecognizer(addImageLblTap)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if /*let newProfilePic = imageView.image,*/let newFirstName = setFirstName.text, let newLastName = setLastName.text, let newPhoneNumber = setPhoneNumber.text, let newEmailId = setEmail.text{

            //profilePic = newProfilePic
            firstName = newFirstName
            lastName = newLastName
            phoneNumber = newPhoneNumber
            emailId = newEmailId
        }
    }
    
}

extension addContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setFirstName.resignFirstResponder()
        setLastName.resignFirstResponder()
        setPhoneNumber.resignFirstResponder()
        setEmail.resignFirstResponder()
        
        return true
    }
    
    @objc func keyboardWillShow1(notification: Notification)
    {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide1(notification: Notification)
    {
        scrollView.contentInset.bottom = 0
    }
    
}

extension addContactViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    
    @objc func selectProfilePic()
    {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        self.present(imageController,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image  = tempImage
        self.dismiss(animated: true, completion: nil)
    }
}

