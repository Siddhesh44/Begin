//
//  pinchGestureViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 02/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class pinchGestureViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        image.isUserInteractionEnabled = true
//        let pinchTOZoom = UIPinchGestureRecognizer(target: self, action: #selector(gesture))
//        image.addGestureRecognizer(pinchTOZoom)
    }
    
    @IBAction func zoomInOut(_ sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1
       
        if sender.state == .ended{
            image.transform = CGAffineTransform.identity
        }
    }
    
    
    
    
    @objc func gesture(sender:UIPinchGestureRecognizer)
       {
//        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
//
//        sender.scale = 1
       }
}
