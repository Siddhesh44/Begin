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
        
        imageView.addBlackGradientLayerInBackground(frame: imageView.bounds, colors:[.black, .clear, .clear])
        searchBar.delegate = self
        
        searchBar.customSearchBar()
        settingUpSearchBar()
        
        //ovalBottomImage()
        //imageView.addBottomRoundedEdge(desiredCurve: 1.5)
        settingGesture()
    }
        
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func settingGesture(){
        // tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(toDismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func toDismissKeyBoard(){
        searchBar.resignFirstResponder()
    }
    
    func settingUpSearchBar()
    {
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.font = textFieldInsideSearchBar?.font?.withSize(16)
        searchBar.setPlaceholder(textColor: #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))
        searchBar.set(textColor: #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))
        textFieldInsideSearchBar?.adjustsFontSizeToFitWidth = true
    }
}

extension barberShopHomeVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


