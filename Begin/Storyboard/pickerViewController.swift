//
//  pickerViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 10/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class pickerViewController: UIViewController {
    
    // creating picker view
    let picker = UIPickerView()
    let datePicker = UIDatePicker()

    @IBOutlet weak var txt: UITextField!
    @IBOutlet weak var date: UITextField!
    
    // creating dataSource
    var bloodGroupName: [String] = [String]()
    var bloodGroupValue: [String] = [String]()
    var available: [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        txt.delegate = self as? UITextFieldDelegate
        
        bloodGroupName = ["A","B","AB","O"]
        bloodGroupValue = ["+","-"]
        available = [1,2,3,4,5,6,7,8]
        
        // picker view display
        picker.backgroundColor = .white
        pickerToolBar()
    }
    
    // creating tool bar toolbar in picker view
    func pickerToolBar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped))
        
        toolBar.setItems([doneButton,spaceButton,cancelButton], animated: true)
        
        // applying picker view on textfield
        txt.inputView = picker
        date.inputView = datePicker
        
        datePicker.datePickerMode = .dateAndTime
        // applying toolbar on textfield
        txt.inputAccessoryView = toolBar
        date.inputAccessoryView = toolBar
    }
    
    @objc func doneTapped()
    {
        txt.resignFirstResponder()
        date.resignFirstResponder()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        date.text = formatter.string(from: datePicker.date)
    }
    
    @objc func cancelTapped()
    {
        txt.resignFirstResponder()
        date.resignFirstResponder()
    }
}

extension pickerViewController: UITextViewDelegate{
    
}

extension pickerViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return bloodGroupName.count
        }
        if component == 1{
            return bloodGroupValue.count
        }
        else
        {
            return available.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return bloodGroupName[row]
        }
        if component == 1{
            return bloodGroupValue[row]
        }
        else
        {
            return String(available[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        txt.text = bloodGroupName[picker.selectedRow(inComponent: 0)] + bloodGroupValue[picker.selectedRow(inComponent: 1)] + String(available[picker.selectedRow(inComponent: 2)])
    }
    
}
