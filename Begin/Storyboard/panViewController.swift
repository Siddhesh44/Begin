//
//  panViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 02/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class panViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handelPan(sender:)))
                image.addGestureRecognizer(pan)
    }
    
    
     @objc func handelPan(sender: UIPanGestureRecognizer)
       {
           let imageView = sender.view!
           let translation = sender.translation(in: view)

               imageView.center = CGPoint(x: image.center.x + translation.x, y: image.center.y + translation.y)
               sender.setTranslation(CGPoint.zero, in: view)
       }
}
