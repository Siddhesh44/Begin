//
//  barberShopSignUoViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 20/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class barberShopSignUpVC: UIViewController {
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailAddressTxt: UITextField!
    @IBOutlet weak var phoneNumberTxt: UITextField!
    @IBOutlet weak var dateOFBirthTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var signUPBtn: UIButton!
    @IBOutlet weak var alreadyHaveAccountLbl: UILabel!
    @IBOutlet weak var noteLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTxt.delegate = self
        emailAddressTxt.delegate = self
        phoneNumberTxt.delegate = self
        dateOFBirthTxt.delegate = self
        passwordTxt.delegate = self
        confirmPasswordTxt.delegate = self
        
        settingUpView()
        settingGesture()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow1(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide1(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        print("sign up clicked")
    }
    // MARK: Gesture setUp
    func settingGesture()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tap)
        
        let alreadyHaveAccountTap = UITapGestureRecognizer(target: self, action: #selector(dismissFromSignUp))
        alreadyHaveAccountLbl.addGestureRecognizer(alreadyHaveAccountTap)
    }
    
    // Gesture Action
    @objc func dismissFromSignUp()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    func settingUpView(){
        signUPBtn.roundButton()
        signUPBtn.setGradientBackground(colorOne: Colors.darkerShadeOfOrange, colorTwo: Colors.lighterShadeOfOrange)
        
        userNameTxt.roundedTextField()
        emailAddressTxt.roundedTextField()
        phoneNumberTxt.roundedTextField()
        dateOFBirthTxt.roundedTextField()
        passwordTxt.roundedTextField()
        confirmPasswordTxt.roundedTextField()
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: noteLbl.text!)
        attributedString.setColor(color: UIColor.black, forText: "Sign up")
        attributedString.setColor(color: UIColor.black, forText: "Terms & Conditions ")
        noteLbl.attributedText = attributedString;
        
        let attributedString1: NSMutableAttributedString = NSMutableAttributedString(string: alreadyHaveAccountLbl.text!)
        attributedString1.setColor(color: #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1), forText: "Already have an account?")
        attributedString1.setColor(color: #colorLiteral(red: 0.9960784314, green: 0.5882352941, blue: 0.3294117647, alpha: 1), forText: "Sign in")
        alreadyHaveAccountLbl.attributedText = attributedString1;
        
        userNameTxt.attributedPlaceholder = NSAttributedString(string:"User name", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        emailAddressTxt.attributedPlaceholder = NSAttributedString(string:"Email address", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        phoneNumberTxt.attributedPlaceholder = NSAttributedString(string:"Phone number", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        dateOFBirthTxt.attributedPlaceholder = NSAttributedString(string:"Date of Birth", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        passwordTxt.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        confirmPasswordTxt.attributedPlaceholder = NSAttributedString(string:"Confirm password", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        
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

extension barberShopSignUpVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTxt.resignFirstResponder()
        emailAddressTxt.resignFirstResponder()
        phoneNumberTxt.resignFirstResponder()
        dateOFBirthTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        confirmPasswordTxt.resignFirstResponder()
        return true
    }
}

