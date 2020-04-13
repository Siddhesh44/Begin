//
//  panGestureViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 02/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class panGestureViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var trashCan: UIImageView!
    
    var imageOrigin: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handelPan(sender:)))
        image.addGestureRecognizer(pan)
        
        imageOrigin = image.frame.origin
        
        view.bringSubviewToFront(image)
    }
    
    
    @objc func handelPan(sender: UIPanGestureRecognizer)
    {
        let imageView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began,.changed:
            imageView.center = CGPoint(x: image.center.x + translation.x, y: image.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if image.frame.intersects(trashCan.frame){
                UIView.animate(withDuration: 0.3, animations: {
                    self.image.alpha = 0.0
                })
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.image.frame.origin = self.imageOrigin
                })
            }
            default:
            break
        }
    }
}
