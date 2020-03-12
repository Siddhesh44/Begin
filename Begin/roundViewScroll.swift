//
//  roundViewScroll.swift
//  Begin
//
//  Created by Infiny Webcom on 11/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class roundViewScroll: UIViewController {

    
    @IBOutlet weak var roundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Round Image
        roundImage.layer.cornerRadius = roundImage.frame.size.width / 2
        roundImage.clipsToBounds = true
        roundImage.layer.borderWidth = 4
        roundImage.layer.borderColor = UIColor.white.cgColor
   
    }
    

   
    @IBAction func toTableView(_ sender: UIButton) {
        performSegue(withIdentifier: "tview", sender: self)

    }
    
    
    @IBAction func toCollectionVIew(_ sender: Any) {
        
        performSegue(withIdentifier: "CView", sender: self)
    }
    
}
