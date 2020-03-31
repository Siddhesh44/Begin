//
//  CS193PViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 30/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class CS193PViewController: UIViewController {
    
    var userIsMiddelOfTyping = false
    
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsMiddelOfTyping{
            let textInDisplay =  display.text!
            display.text = textInDisplay + digit
        } else{
            display.text = digit
            userIsMiddelOfTyping = true
        }
    }
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsMiddelOfTyping = false
        let mathematicalSymbol = sender.currentTitle
        
        switch mathematicalSymbol {
        case "π":
            displayValue = Double.pi
        case "√":
           displayValue = sqrt(displayValue)
        default:
            break
        }
    }
}
