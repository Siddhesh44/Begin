//
//  OTPVC.swift
//  Begin
//
//  Created by Siddhesh jadhav on 03/06/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//


import UIKit

class OTPVC: UIViewController {
    
    @IBOutlet weak var timerLbl: UILabel!

    @IBOutlet weak var otpField1: UITextField!
    @IBOutlet weak var otpField2: UITextField!
    @IBOutlet weak var otpField3: UITextField!
    @IBOutlet weak var otpField4: UITextField!
    
    
    @IBOutlet weak var otp1: UITextView!
    @IBOutlet weak var otp2: UITextView!
    @IBOutlet weak var otp3: UITextView!
    @IBOutlet weak var otp4: UITextView!
    
    var duration = 0.30
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpField1.delegate = self
        otpField2.delegate = self
        otpField3.delegate = self
        otpField4.delegate = self
        
        otp1.delegate = self
        otp2.delegate = self
        otp3.delegate = self
        otp4.delegate = self
        
        otp1.layer.borderWidth = 1
        otp1.layer.borderColor = UIColor.red.cgColor
        otp2.layer.borderWidth = 1
        otp2.layer.borderColor = UIColor.red.cgColor
        otp3.layer.borderWidth = 1
        otp3.layer.borderColor = UIColor.red.cgColor
        otp4.layer.borderWidth = 1
        otp4.layer.borderColor = UIColor.red.cgColor
        
        otp1.textContainerInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        otp2.textContainerInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        otp3.textContainerInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        otp4.textContainerInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        
        //otpField1.becomeFirstResponder()
        otp1.becomeFirstResponder()
        
        timerLbl.text = String(format: "%.2f", duration)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(OTPVC.timerAction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerAction(){
        duration -= 0.01
        timerLbl.text = String(format: "%.2f", duration)
        if duration < 0{
            timer.invalidate()
            timerLbl.text = "Resend OTP"
        }
    }
    
}

extension OTPVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.isBackspace{
            print("BackSpace pressed")
        }
        
        // go forward
        if textField.text!.count < 1 && string.count > 0 {
            if textField == otpField1{
                otpField2.becomeFirstResponder()
            }
            if textField == otpField2{
                otpField3.becomeFirstResponder()
            }
            if textField == otpField3{
                otpField4.becomeFirstResponder()
            }
            if textField == otpField4{
                otpField4.resignFirstResponder()
            }
            textField.text = string
            return false
            
            // go backwards
        } else if textField.text!.count >= 1 && string.count == 0 {
            if textField == otpField2{
                otpField1.becomeFirstResponder()
            }
            if textField == otpField3{
                otpField2.becomeFirstResponder()
            }
            if textField == otpField4{
                otpField3.becomeFirstResponder()
            }
            if textField == otpField1{
                otpField1.resignFirstResponder()
            }
            textField.text = " "
            return false
            // change text
        } else if textField.text!.count >= 1 {
            if textField == otpField1{
                otpField2.becomeFirstResponder()
            }
            if textField == otpField2{
                otpField3.becomeFirstResponder()
            }
            if textField == otpField3{
                otpField4.becomeFirstResponder()
            }
            if textField == otpField4{
                otpField4.resignFirstResponder()
            }
            textField.text = string
            return false
        }
        return true
    }
    
}

extension OTPVC: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text.isBackspace{
            print("BackSpace pressed")
        }
        
        // go forward
        if textView.text!.count < 1 && text.count > 0 {
            if textView == otp1{
                otp2.becomeFirstResponder()
            }
            if textView == otp2{
                otp3.becomeFirstResponder()
            }
            if textView == otp3{
                otp4.becomeFirstResponder()
            }
            if textView == otp4{
                otp4.resignFirstResponder()
            }
            textView.text = text
            return false
            
            // go backwards
        } else if textView.text!.count >= 1 && text.count == 0 {
            if textView == otp2{
                otp1.becomeFirstResponder()
            }
            if textView == otp3{
                otp2.becomeFirstResponder()
            }
            if textView == otp4{
                otp3.becomeFirstResponder()
            }
            if textView == otp1{
                otp1.resignFirstResponder()
            }
            textView.text = ""
            return false
            
            // change text
        } else if textView.text!.count >= 1 {
            if textView == otp1{
                otp2.becomeFirstResponder()
            }
            if textView == otp2{
                otp3.becomeFirstResponder()
            }
            if textView == otp3{
                otp4.becomeFirstResponder()
            }
            if textView == otp4{
                otp4.resignFirstResponder()
            }
            textView.text = text
            return false
            // backspace
        }else if textView.text!.isEmpty && text.isBackspace{
            if textView == otp2{
                otp1.becomeFirstResponder()
            }
            if textView == otp3{
                otp2.becomeFirstResponder()
            }
            if textView == otp4{
                otp3.becomeFirstResponder()
            }
            if textView == otp1{
                otp1.resignFirstResponder()
            }
            textView.text = ""
            return false
        }
        return true
    }
}


extension String {
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
}

