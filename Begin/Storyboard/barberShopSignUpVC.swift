//
//  barberShopSignUoViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 20/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class barberShopSignUpVC: UIViewController {
    
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailAddressTxt: UITextField!
    @IBOutlet weak var phoneNumberTxt: UITextField!
    @IBOutlet weak var dateOFBirthTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var signUPBtn: UIButton!
    @IBOutlet weak var alreadyHaveAccountLbl: UILabel!
    @IBOutlet weak var signInLbl: UILabel!
    @IBOutlet weak var noteLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTxt.delegate = self
        emailAddressTxt.delegate = self
        phoneNumberTxt.delegate = self
        dateOFBirthTxt.delegate = self
        passwordTxt.delegate = self
        confirmPasswordTxt.delegate = self
        
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
        
        settingGesture()
    }
    
    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        print("sign up clicked")
    }
    // MARK: Gesture setUp
    func settingGesture()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tap)
        
        let alreadyHaveAccountTap = UITapGestureRecognizer(target: self, action: #selector(alreadyHaveAccount))
        alreadyHaveAccountLbl.addGestureRecognizer(alreadyHaveAccountTap)
        
        let signInTap = UITapGestureRecognizer(target: self, action: #selector(signIn))
        signInLbl.addGestureRecognizer(signInTap)
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

