//
//  barberShopHomeVC.swift
//  Begin
//
//  Created by Siddhesh jadhav on 24/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class barberShopHomeVC: UIViewController {
    
    @IBOutlet weak var menu: UIImageView!
    @IBOutlet weak var filterOptions: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        searchBar.customSearchBar()
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.font = textFieldInsideSearchBar?.font?.withSize(16)
        searchBar.setPlaceholder(textColor: #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))
        searchBar.set(textColor: #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))
        
       // ovalBottomImage()
        imageView.addBottomRoundedEdge(desiredCurve: 1.5)
        settingGesture()
    }
    
    func settingGesture(){
        // tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(toDismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func toDismissKeyBoard(){
        searchBar.resignFirstResponder()
    }
        
    func ovalBottomImage()
    {
        let imageSize = imageView.frame
        
        imageView.clipsToBounds = true
        
        let curveRadius: CGFloat = imageSize.width * 0.010
        let invertedRadius: CGFloat = 1.0 / curveRadius
        
        // draw ellipse in rect with big width, but same height
        let ellipticalPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: imageSize.width + 2 * invertedRadius * imageSize.width, height: imageSize.height))
        
        // transform it to center of imageView
        ellipticalPath.apply(CGAffineTransform(translationX: -imageSize.width * invertedRadius, y: 0))
        
        // create rectangle path exactly similar to imageView
        let rectanglePath = UIBezierPath(rect: imageView.bounds)
        
        // translate it by 0.5 ratio in order to create intersection between circle and rectangle
        rectanglePath.apply(CGAffineTransform(translationX: 0, y: -imageSize.height * CGFloat(0.5)))
        
        // append rectangle to elliptical path
        ellipticalPath.append(rectanglePath)
        
        
        // create mask
        let maskLayer = CAShapeLayer()
        maskLayer.frame = imageView.bounds
        maskLayer.path = ellipticalPath.cgPath
        imageView.layer.mask = maskLayer
    }
}

extension barberShopHomeVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
