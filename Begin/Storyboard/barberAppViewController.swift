//
//  barberAppViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit


class barberAppViewController: UIViewController {
    
   
    
    @IBOutlet weak var connectWithGoogleBtn: UIButton!
    @IBOutlet weak var connectWithFaceBookBtn: UIButton!
    @IBOutlet weak var alreadyHaveAccountLbl: UILabel!
    @IBOutlet weak var signInLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectWithGoogleBtn.roundButton()
        connectWithFaceBookBtn.roundButton()
        
        connectWithGoogleBtn.setGradientBackground(colorOne: Colors.darkerShadeOfOrange, colorTwo: Colors.lighterShadeOfOrange)
        
        
        settingGesture()
        
//        let text = connectWithGoogleBtn.titleLabel?.text
//        let attr = NSMutableAttributedString(string: text!)
//        attr.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSMakeRange(0, text!.count))
//        connectWithGoogleBtn.setAttributedTitle(attr, for: UIControl.State.normal)

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
        let alreadyHaveAccountTap = UITapGestureRecognizer(target: self, action: #selector(alreadyHaveAccount))
        alreadyHaveAccountLbl.addGestureRecognizer(alreadyHaveAccountTap)
        
        let signInTap = UITapGestureRecognizer(target: self, action: #selector(signIn))
        signInLbl.addGestureRecognizer(signInTap)
    }
}
