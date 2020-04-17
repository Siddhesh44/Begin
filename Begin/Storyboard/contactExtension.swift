//
//  contactExtension.swift
//  Begin
//
//  Created by Siddhesh jadhav on 17/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

var addCon = addContactViewController()

extension UIViewController{
    
    func managingKeyBoard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureOnView))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(addCon.keyboardWillShow1(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addCon.keyboardWillHide1(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    
    
    @objc func tapGestureOnView()
    {
        view.endEditing(true)
    }
    
//    @objc func keyboardWillShow1(notification: Notification)
//    {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            addCon.scrollView.contentInset.bottom = keyboardSize.height
//        }
//    }
//    
//    @objc func keyboardWillHide1(notification: Notification)
//    {
//        addCon.scrollView.contentInset.bottom = 0
//    }
    
}



extension UIImageView{
    
    func roundedImage()
    {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
