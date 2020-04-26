//
//  barberAppViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit


class barberAppViewController: UIViewController {
    
    let loginView = UIView()
    let emailTxt =  UITextField(frame: CGRect(x: 24, y: 154, width: 366, height: 44))
    let passwordTxt =  UITextField(frame: CGRect(x: 24, y: 218, width: 366, height: 44))
    
    
    @IBOutlet weak var connectWithGoogleBtn: UIButton!
    @IBOutlet weak var connectWithFaceBookBtn: UIButton!
    @IBOutlet weak var alreadyHaveAccountLbl: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUpView()
        settingGesture()
        
        backImage.addBlackGradientLayerInBackground(frame: view.bounds, colors:[.clear, .black])
    }
    
    func createLoginView()
    {
        self.view.addSubview(loginView)
        loginView.frame = CGRect(x:0 , y: view.bounds.height, width: view.bounds.width, height: 499)
        UIView.animate(withDuration: 1) {
            self.loginView.frame = CGRect(x:0 , y: self.view.bounds.maxY-499, width: self.view.bounds.width, height: 499)
            self.loginView.backgroundColor = .white
            self.loginView.roundedView()
            self.loginView.isUserInteractionEnabled = true
        }
        
        let welcomeBackLbl = UILabel()
        welcomeBackLbl.frame = CGRect(x: 104, y: 41, width: 206, height: 41)
        welcomeBackLbl.text = "Welcome Back"
        welcomeBackLbl.textAlignment = NSTextAlignment.center
        welcomeBackLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        welcomeBackLbl.font = UIFont(name: "Tofino-Bold", size: 30)
        welcomeBackLbl.adjustsFontSizeToFitWidth = true
        loginView.addSubview(welcomeBackLbl)
        
        welcomeBackLbl.translatesAutoresizingMaskIntoConstraints = false
        welcomeBackLbl.topAnchor.constraint(equalTo: loginView.topAnchor,constant: 41.0).isActive = true
        welcomeBackLbl.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 104.0).isActive = true
        welcomeBackLbl.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -104.0).isActive = true
        
        let loginToAccountLbl = UILabel()
        loginToAccountLbl.frame = CGRect(x: 137.33, y: 91.0, width: 139.33, height: 19.33)
        loginToAccountLbl.text = "Login to your account"
        loginToAccountLbl.textAlignment = NSTextAlignment.center
        loginToAccountLbl.textColor = #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
        loginToAccountLbl.font = UIFont(name: "Tofino-Regular", size: 14)
        loginToAccountLbl.adjustsFontSizeToFitWidth = true
        loginView.addSubview(loginToAccountLbl)
        
        loginToAccountLbl.translatesAutoresizingMaskIntoConstraints = false
        loginToAccountLbl.topAnchor.constraint(equalTo: welcomeBackLbl.bottomAnchor,constant: 9.0).isActive = true
        loginToAccountLbl.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 137.33).isActive = true
        loginToAccountLbl.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -137.33).isActive = true
        
        // MARK: login view textfield
        emailTxt.attributedPlaceholder = NSAttributedString(string:"Email", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        emailTxt.customTextField()
        emailTxt.roundedTextField()
        emailTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTxt.frame.height))
        emailTxt.leftViewMode = .always
        emailTxt.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTxt.frame.height))
        emailTxt.rightViewMode = .always
        loginView.addSubview(emailTxt)
        
        emailTxt.translatesAutoresizingMaskIntoConstraints = false
        emailTxt.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTxt.topAnchor.constraint(equalTo: loginToAccountLbl.bottomAnchor,constant: 43.67).isActive = true
        emailTxt.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 24.0).isActive = true
        emailTxt.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -24.0).isActive = true
        
        passwordTxt.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        passwordTxt.customTextField()
        passwordTxt.isSecureTextEntry = true
        passwordTxt.roundedTextField()
        passwordTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTxt.frame.height))
        passwordTxt.leftViewMode = .always
        passwordTxt.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTxt.frame.height))
        passwordTxt.rightViewMode = .always
        loginView.addSubview(passwordTxt)
        
        passwordTxt.translatesAutoresizingMaskIntoConstraints = false
        passwordTxt.heightAnchor.constraint(equalToConstant: 44).isActive = true
        passwordTxt.topAnchor.constraint(equalTo: emailTxt.bottomAnchor,constant: 20.0).isActive = true
        passwordTxt.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 24.0).isActive = true
        passwordTxt.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -24.0).isActive = true
        
        let button:UIButton = UIButton(frame: CGRect(x: 32, y: 304, width: 350, height: 44))
        button.setGradientBackground(colorOne: Colors.darkerShadeOfOrange, colorTwo: Colors.lighterShadeOfOrange)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Tofino-Regular", size: 16)
        button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.roundButton()
        loginView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.topAnchor.constraint(equalTo: passwordTxt.bottomAnchor,constant: 42.0).isActive = true
        button.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 32.0).isActive = true
        button.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -32.0).isActive = true
        
        let forgotPasswordLbl = UILabel()
        forgotPasswordLbl.frame = CGRect(x: 123.67, y: 363.0, width: 166.67, height: 19.33)
        forgotPasswordLbl.text = "Forgot your password?"
        forgotPasswordLbl.textAlignment = NSTextAlignment.center
        forgotPasswordLbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        forgotPasswordLbl.font = UIFont(name: "Tofino-Regular", size: 14)
        forgotPasswordLbl.isUserInteractionEnabled = true
        forgotPasswordLbl.adjustsFontSizeToFitWidth = true
        loginView.addSubview(forgotPasswordLbl)
        
        forgotPasswordLbl.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLbl.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 15.0).isActive = true
        forgotPasswordLbl.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 123.67).isActive = true
        forgotPasswordLbl.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -123.67).isActive = true
        
        let signUPLbl = UILabel()
        signUPLbl.frame = CGRect(x: 106.0, y: 435.0, width: 202.33, height: 19.33)
        signUPLbl.text = "Don't have an account? Sign up"
        signUPLbl.textAlignment = NSTextAlignment.center
        //signUPLbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        signUPLbl.font = UIFont(name: "Tofino-Regular", size: 14)
        signUPLbl.isUserInteractionEnabled = true
        signUPLbl.adjustsFontSizeToFitWidth = true
        loginView.addSubview(signUPLbl)
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: signUPLbl.text!)
        attributedString.setColor(color: #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1), forText: "Don't have an account?")
        attributedString.setColor(color: #colorLiteral(red: 0.9960784314, green: 0.5882352941, blue: 0.3294117647, alpha: 1), forText: "Sign up")
        signUPLbl.attributedText = attributedString;
        
        signUPLbl.translatesAutoresizingMaskIntoConstraints = false
        signUPLbl.topAnchor.constraint(equalTo: forgotPasswordLbl.bottomAnchor,constant: 52.67).isActive = true
        signUPLbl.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 106.0).isActive = true
        signUPLbl.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -105.67).isActive = true
        
        // tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        loginView.addGestureRecognizer(tap)
        
        let forgotPasswordTap = UITapGestureRecognizer(target: self, action: #selector(forgotPassword))
        forgotPasswordLbl.addGestureRecognizer(forgotPasswordTap)
        
        let dontHaveAccountTap = UITapGestureRecognizer(target: self, action: #selector(dontHaveAccount))
        signUPLbl.addGestureRecognizer(dontHaveAccountTap)
        
        // pan
        let panGestureForDismissView = UIPanGestureRecognizer(target: self, action: #selector(dismissLoginView(sender:)))
        loginView.addGestureRecognizer(panGestureForDismissView)
        
        emailTxt.delegate = self
        passwordTxt.delegate = self
        
        // scroll view
        
        
    }
    
    @IBAction func connectWithGoogleClicked(_ sender: UIButton) {
        print("connect with google clicked")
    }
    
    @IBAction func connectWithFacebookClicked(_ sender: UIButton) {
        print("connect with facebook clicked")
    }
    
    // MARK: Gesture setUp
    func settingGesture()
    {
        // tap
        let alreadyHaveAccountTap = UITapGestureRecognizer(target: self, action: #selector(alreadyHaveAccount))
        alreadyHaveAccountLbl.addGestureRecognizer(alreadyHaveAccountTap)
    }
    @objc func alreadyHaveAccount()
    {
        print("Already have Account tapped")
        createLoginView()
    }
    @objc func forgotPassword()
    {
        print("forgot password tapped")
    }
    
    @objc func dontHaveAccount()
    {
        print("dont have Account tapped")
        
        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "barberShopSignUpVC")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC,animated: true,completion: nil)
    }
    
    
    @objc func buttonClicked() {
        print("Button Clicked")
    }
    
    @objc func dismissLoginView(sender: UIPanGestureRecognizer)
    {
        print("dismiss loginView Tapped")
        
        let viewTranslation = sender.translation(in: view)
        
        switch sender.state {
        case .began,.changed:
            UIView.animate(withDuration: 0.5, animations: {
                self.loginView.transform = CGAffineTransform(translationX: 0, y: viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 250{
                UIView.animate(withDuration: 0.5, animations: {
                    self.loginView.transform = .identity
                })
            } else {
                print("view dismissed")
                self.loginView.removeFromSuperview()
            }
        default:
            break
        }
    }
    
    func settingUpView()
    {
        connectWithGoogleBtn.roundButton()
        connectWithFaceBookBtn.roundButton()
        
        connectWithGoogleBtn.setGradientBackground(colorOne: Colors.darkerShadeOfOrange, colorTwo: Colors.lighterShadeOfOrange)
        
        connectWithGoogleBtn.bringSubviewToFront(connectWithGoogleBtn.imageView!)
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: alreadyHaveAccountLbl.text!)
        attributedString.setColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forText: "Already have an account?")
        attributedString.setColor(color: #colorLiteral(red: 0.9960784314, green: 0.5882352941, blue: 0.3294117647, alpha: 1), forText: "Sign in")
        alreadyHaveAccountLbl.attributedText = attributedString;
        
    }
}

extension barberAppViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        return true
    }
}