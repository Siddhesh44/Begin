//
//  swipeGestureViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 02/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class swipeGestureViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        image.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        image.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        image.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        image.addGestureRecognizer(swipeDown)
    }
    
    
    @objc func swipeAction(sender:UIGestureRecognizer)
    {
        if let swipe = sender as? UISwipeGestureRecognizer
        {
            switch swipe.direction {
            case .right:
                print("swiped right")
                image.image = #imageLiteral(resourceName: "right")
                break
            case .left:
                print("swiped left")
                image.image = #imageLiteral(resourceName: "left")
                break
            case .up:
                print("swiped up")
               image.image = #imageLiteral(resourceName: "up")
                break
            case .down:
                print("swiped down")
               image.image = #imageLiteral(resourceName: "down")
                break
            default:
                print("did not swipe")
            }
        }
    }
    
}
