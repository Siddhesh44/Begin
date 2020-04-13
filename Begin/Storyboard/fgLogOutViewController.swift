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
    override func viewDidLoad() {
        super.viewDidLoad()

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
