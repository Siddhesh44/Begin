//
//  barberShopLoginViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class barberShopLoginVC: UIViewController {
    
    
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgotPasswordLbl: UILabel!
    @IBOutlet weak var dontHaveAccountLbl: UILabel!
    @IBOutlet weak var loginView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTxt.delegate = self
        passwordTxt.delegate = self
        
        settingUpView()
        settingGesture1()
    }
    
    // MARK: Gesture setUp
    func settingGesture1()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tap)
        
//        let forgotPasswordTap = UITapGestureRecognizer(target: self, action: #selector(forgotPassword))
//        forgotPasswordLbl.addGestureRecognizer(forgotPasswordTap)
//        
//        let dontHaveAccountTap = UITapGestureRecognizer(target: self, action: #selector(dontHaveAccount))
//        dontHaveAccountLbl.addGestureRecognizer(dontHaveAccountTap)
    }
    
    func settingUpView()
    {
        loginView.roundedView()
        loginBtn.roundButton()
        loginBtn.setGradientBackground(colorOne: Colors.darkerShadeOfOrange, colorTwo: Colors.lighterShadeOfOrange)
        
        emailTxt.roundedTextField()
        passwordTxt.roundedTextField()
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: dontHaveAccountLbl.text!)
        attributedString.setColor(color: #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1), forText: "Don't have an account?")
        attributedString.setColor(color: #colorLiteral(red: 0.9960784314, green: 0.5882352941, blue: 0.3294117647, alpha: 1), forText: "Sign up")
        dontHaveAccountLbl.attributedText = attributedString;
    }
    
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        print("Login button clicked")
    }
}

extension barberShopLoginVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        return true
    }
}
