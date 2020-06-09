//
//  fgLogOutViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 09/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class fgLogOutViewController: UIViewController{
    
    var loginData: LoginModel?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let email = loginData?.email{
            print("user email id",email)
        }
        
        if let tokens = loginData?.deviceToken{
            print(tokens)
            for token in tokens{
                print("device token:",token)
            }
        }
       
    }
    
    @IBAction func googleLogOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        if GIDSignIn.sharedInstance()?.currentUser == nil{
            let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "mainView")
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func logOut(_ sender: UIButton) {
        LoginManager().logOut()
        print(AccessToken.current)
        if AccessToken.current == nil{
            let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "mainView")
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
}


