//
//  barber shop extension.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

class UITextFieldPadding1 : UITextField {
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 25, bottom: 5, right: (bounds.width - 45))
           // titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}



extension UIView{
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func roundedView()
    {
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}

extension UIButton{
    func roundButton()
    {
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
    }
}

extension UITextField{
    func roundedTextField() {
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
    }
}

extension NSMutableAttributedString {
    
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}

extension UIViewController{
    
    // Tap gesture Action
    @objc func tapGesture()
    {
        view.endEditing(true)
    }
    
    @objc func alreadyHaveAccount()
    {
        print("Already have Account tapped")
        performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
    @objc func dontHaveAccount()
    {
        print("dont have Account tapped")
        performSegue(withIdentifier: "signUpSegue", sender: self)
    }
    
    @objc func signIn()
    {
        print("sign in tapped")
        performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
    @objc func signUP()
    {
        print("sign up tapped")
        performSegue(withIdentifier: "signUpSegue", sender: self)
    }
    
    @objc func forgotPassword()
    {
        print("forgot password tapped")
    }
    
    
    
}


