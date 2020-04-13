//
//  textViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 04/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class textViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text1.delegate = self
        text2.delegate = self
        text3.delegate = self
        textView.delegate = self
        
        //  keyborad appears on launch on text1
        // text1.becomeFirstResponder()
        
        // MARK: show textfield when keyboard appears
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // MARK: tap gesture to disappear keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(handelTap))
        self.view.addGestureRecognizer(tap)
    }
    
}

extension textViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // keyboard disappear on presing retun key
        text1.resignFirstResponder()
        text2.resignFirstResponder()
        text3.resignFirstResponder()
        
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
    
    @objc func handelTap()
    {
        view.endEditing(true)
    }
    
}

extension textViewController: UITextViewDelegate{
    
}
