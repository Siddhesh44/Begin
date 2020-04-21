//
//  alamofireExampleViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 03/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

// https://intervid.infiny.dev/users/login
// eldhose.m@gmail.com


import UIKit
import Alamofire
import SwiftyJSON
import GoogleSignIn
import FacebookCore
import FacebookLogin

class alamofireExampleViewController: UIViewController,GIDSignInDelegate{
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userEmailTxt: UITextField!
    @IBOutlet weak var userPasswordTxt: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signInWithFacebookBtn: UIButton!
    @IBOutlet weak var signInWithGmailBtn: UIButton!
    @IBOutlet weak var signUpLbl: UILabel!
    @IBOutlet weak var forgotPasswordlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rounded corner view
        loginView.layer.cornerRadius = 20
        
        userEmailTxt.delegate = self
        userPasswordTxt.delegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        settingUpGestures()
        
        settingUpTextfield()
        
        settingUpUIButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let checkToken = AccessToken.current,!checkToken.isExpired{
            print("user is already logged in through facebook")
            self.performSegue(withIdentifier: "signInSuccessful", sender: self)
            print(AccessToken.self)
        }
        else{
            print("User Logged out from facebook")
        }
        
        if (GIDSignIn.sharedInstance().currentUser != nil) {
            print("user is already logged in through google")
            self.performSegue(withIdentifier: "signInSuccessful", sender: self)
        }
        else{
            print("User Logged out from google")
        }
    }
    
    func settingUpUIButton()
    {
        // round corner button
        signInBtn.layer.cornerRadius = 20
        signInWithFacebookBtn.layer.cornerRadius = 20
        signInWithGmailBtn.layer.cornerRadius = 20
        
        // auto sizing button text
        signInWithFacebookBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        signInWithGmailBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func settingUpTextfield()
    {
        // set icon in textfield
        userEmailTxt.tintColor = UIColor.gray
        userEmailTxt.setIcon(#imageLiteral(resourceName: "mail"))
        userPasswordTxt.tintColor = UIColor.gray
        userPasswordTxt.setIcon(#imageLiteral(resourceName: "icons8-forgot-password-50"))
        
        // round corner textfield
        userEmailTxt.layer.cornerRadius = 25
        userPasswordTxt.layer.cornerRadius = 25
        
        // border for textfield
        userEmailTxt.layer.borderWidth = 1
        userEmailTxt.layer.borderColor = UIColor.gray.cgColor
        userPasswordTxt.layer.borderWidth = 1
        userPasswordTxt.layer.borderColor = UIColor.gray.cgColor
        
        // Placeholder
        userEmailTxt.attributedPlaceholder =
            NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        userPasswordTxt.attributedPlaceholder =
            NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    
    func settingUpGestures()
    {
        // tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture1))
        self.view.addGestureRecognizer(tap)
        
        let signUpTap = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        self.signUpLbl.addGestureRecognizer(signUpTap)
        
        let forgotPasswordTap = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        self.forgotPasswordlbl.addGestureRecognizer(forgotPasswordTap)
    }
    
    // Gestures functions
    
    @objc func tapGesture1()
    {
        view.endEditing(true)
    }
    
    @objc func signUpTapped(sender: UITapGestureRecognizer)
    {
        print("signUpTapped")
    }
    
    @objc func forgotPasswordTapped(sender: UITapGestureRecognizer)
    {
        print("forgotPasswordTapped")
    }
    
    // MARK: sign in through app
    
    @IBAction func signInBtn(_ sender: UIButton) {
        let email = userEmailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = userPasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var parameters: [String: Any] = ["email": email, "password": pass, "deviceToken": "fgdvsdgvdfsgvefr", "user_type": "jobseeker"]
        parameters["agency_id"] = "5e15a4df13de410c28587583"
        
        AF.request("https://intervid.infiny.dev/users/login",method: .post,parameters: parameters).validate().responseJSON { response in
            switch response.result{
            case .success(let value):
                if let data = value as? Dictionary<String,AnyObject>
                {
                    print(data)
                    let resultValue = data as NSDictionary
                    let code = resultValue["errcode"] as! Int
                    if code == 0
                    {
                        self.performSegue(withIdentifier: "signInSuccessful", sender: self)
                    }
                    else
                    {
                        print("error")
                    }
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    // MARK: sign in with facebook
    @IBAction func signInWithFacebook(_ sender: UIButton) {
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile,.email], viewController: self) { (result) in
            switch result{
            case .cancelled:
                print("User cancelled login process")
            case .success(let granted, let declined, let token):
                print("user sign in through facebook")
                let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "logoutView")
                nextViewController.modalPresentationStyle = .fullScreen
                self.present(nextViewController, animated: true, completion: nil)
                self.showDetails()
            case .failed(let error):
                print("login falied with error = \(error.localizedDescription)")
            }
        }
    }
    func showDetails()
    {
        GraphRequest(graphPath: "/me", parameters: ["fields":"id,name,email"]).start { (connection, result
            , err) in
            //print(result)
            guard let Info = result as? [String: Any] else { return }
            
            if let userName = Info["name"] as? String
            {
                print(userName)
            }
        }
    }
    
    // MARK: sign in with google
    @IBAction func signInWithGmail(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print("\(error.localizedDescription)")
        }
        else{
            print("user signed in through google")
            print(user.profile.email!)
            let accessToken = GIDSignIn.sharedInstance().currentUser.authentication.accessToken
            print(accessToken)
            let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "logoutView")
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
}

extension alamofireExampleViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userEmailTxt.resignFirstResponder()
        userPasswordTxt.resignFirstResponder()
        return true
    }
    
    @objc func keyboardWillShow(notification: Notification)
    {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: Notification)
    {
        scrollView.contentInset.bottom = 0
    }
}

// to set container in textfield for icon
extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 5, width: 20, height: 20))
        //  iconView.backgroundColor = UIColor.red
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        //iconContainerView.backgroundColor = UIColor.blue
        rightView = iconContainerView
        rightViewMode = .always
    }
}



//extension UIButton {
//    @IBInspectable var adjustFontSizeToWidth: Bool {
//        get {
//            return self.titleLabel!.adjustsFontSizeToFitWidth
//        }
//        set {
//            self.titleLabel?.numberOfLines = 1
//            self.titleLabel?.adjustsFontSizeToFitWidth = newValue;
//            self.titleLabel?.lineBreakMode = .byClipping;
//            self.titleLabel?.baselineAdjustment = .alignCenters
//        }
//    }
//}

