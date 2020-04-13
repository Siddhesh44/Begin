//
//  gestureRecognizerViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 02/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class gestureRecognizerViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(gesture))
//        longPress.minimumPressDuration = 5
//        view.addGestureRecognizer(longPress)
        
       
    }
    
    
    
    @IBAction func pinchToZoomInOut(_ sender: UIPinchGestureRecognizer) {
      //  sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        
       // sender.scale = 1
    }
    
    
    @IBAction func tapOnView(_ sender: Any) {
        print("tapped on View")
    }
    
   
    @IBAction func longPressOnImage(_ sender: Any) {
        
        if image.image == #imageLiteral(resourceName: "Evolution_by_will_yen-500x500") {
            image.image = #imageLiteral(resourceName: "i8cgUE")
        }
        else{
            image.image = #imageLiteral(resourceName: "Evolution_by_will_yen-500x500")
        }
    }
  
    
    @IBAction func toPinchView(_ sender: UIButton) {
        performSegue(withIdentifier:"pinchView", sender: self)
    }
    
    @IBAction func toRotationView(_ sender: UIButton) {
        performSegue(withIdentifier:"rotationView", sender: self)

    }
    @IBAction func toSwipeView(_ sender: UIButton) {
        performSegue(withIdentifier:"swipeView", sender: self)

    }
    
    @IBAction func toPanView(_ sender: UIButton) {
        
        performSegue(withIdentifier: "panView", sender: self)
    }
    
    @IBAction func toEdgeView(_ sender: UIButton) {
        performSegue(withIdentifier: "edgePanView", sender: self)
    }
}
