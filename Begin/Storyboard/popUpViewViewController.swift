//
//  popUpViewViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 22/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class popUpViewViewController: UIViewController {
    
    
    @IBOutlet var mainView: UIView!
    let loginView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapped()
    {
        print("tapped")
        loginView.removeFromSuperview()
    }

    
    @IBAction func clicked(_ sender: UIButton) {
        print("clicked")
        
        self.view.addSubview(loginView)
        loginView.frame = CGRect(x:0 , y: 363, width: view.bounds.width, height: 499)
        loginView.backgroundColor = .white
        
        loginView.roundedView()
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.heightAnchor.constraint(equalToConstant: 499).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let welcomeBackLbl = UILabel()
        welcomeBackLbl.frame = CGRect(x: 104, y: 41, width: 206, height: 41)
        welcomeBackLbl.text = "Welcome Back"
        welcomeBackLbl.textAlignment = NSTextAlignment.center
        welcomeBackLbl.textColor = .black
        welcomeBackLbl.font = UIFont.boldSystemFont(ofSize: 30)
        loginView.addSubview(welcomeBackLbl)
        
        let loginToAccountLbl = UILabel()
        loginToAccountLbl.frame = CGRect(x: 137.33, y: 91.0, width: 139.33, height: 19.33)
        loginToAccountLbl.text = "Login to your account"
        loginToAccountLbl.textAlignment = NSTextAlignment.center
        loginToAccountLbl.textColor = #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
        loginToAccountLbl.font = UIFont.systemFont(ofSize: 14)
        loginView.addSubview(loginToAccountLbl)
        
        let forgotPasswordLbl = UILabel()
        forgotPasswordLbl.frame = CGRect(x: 123.67, y: 363.0, width: 166.67, height: 19.33)
        forgotPasswordLbl.text = "Forgot your password?"
        forgotPasswordLbl.textAlignment = NSTextAlignment.center
        forgotPasswordLbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        forgotPasswordLbl.font = UIFont.systemFont(ofSize: 14)
        loginView.addSubview(forgotPasswordLbl)
        
        let signUPLbl = UILabel()
        signUPLbl.frame = CGRect(x: 106.0, y: 435.0, width: 202.33, height: 19.33)
        signUPLbl.text = "Don't have an account? Sign up"
        signUPLbl.textAlignment = NSTextAlignment.center
        signUPLbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        signUPLbl.font = UIFont.systemFont(ofSize: 14)
        loginView.addSubview(signUPLbl)

        
        let button:UIButton = UIButton(frame: CGRect(x: 32, y: 304, width: 350, height: 44))
        button.setGradientBackground(colorOne: Colors.darkerShadeOfOrange, colorTwo: Colors.lighterShadeOfOrange)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
       // button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
        loginView.addSubview(button)
        
        let emailTxt =  UITextField(frame: CGRect(x: 24, y: 154, width: 366, height: 44))
          emailTxt.placeholder = "Email"
           emailTxt.font = UIFont.systemFont(ofSize: 15)
           emailTxt.borderStyle = UITextField.BorderStyle.roundedRect
           emailTxt.autocorrectionType = UITextAutocorrectionType.no
           emailTxt.keyboardType = UIKeyboardType.default
           emailTxt.returnKeyType = UIReturnKeyType.done
           emailTxt.clearButtonMode = UITextField.ViewMode.whileEditing
           emailTxt.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailTxt.roundedTextField()
        loginView.addSubview(emailTxt)
        
        let passwordTxt =  UITextField(frame: CGRect(x: 24, y: 218, width: 366, height: 44))
                passwordTxt.placeholder = "Passowrd"
                 passwordTxt.font = UIFont.systemFont(ofSize: 15)
                 passwordTxt.borderStyle = UITextField.BorderStyle.roundedRect
                 passwordTxt.autocorrectionType = UITextAutocorrectionType.no
                 passwordTxt.keyboardType = UIKeyboardType.default
                 passwordTxt.returnKeyType = UIReturnKeyType.done
                 passwordTxt.clearButtonMode = UITextField.ViewMode.whileEditing
                 passwordTxt.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordTxt.roundedTextField()
                 loginView.addSubview(passwordTxt)

    }
    
//    @objc func buttonClicked() {
//        print("Button Clicked")
//    }
}
