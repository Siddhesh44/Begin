//
//  rotationViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 02/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class rotationViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotation))
        image.addGestureRecognizer(rotate)
    }
    
    @IBAction func toRotate(_ sender: UIRotationGestureRecognizer) {
        
//        sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
//                sender.rotation = 0
        //image.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    
    
    @objc func rotation(sender: UIRotationGestureRecognizer)
    {
        sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
        sender.rotation = 0
        
        if sender.state == .ended{
        image.transform = CGAffineTransform.identity
        }
    }
    
  
    
}
