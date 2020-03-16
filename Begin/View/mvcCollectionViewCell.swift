//
//  mvcCollectionViewCell.swift
//  Begin
//
//  Created by Siddhesh jadhav on 14/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class mvcCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    var data:mvcModel?
    {
        didSet
        {
            img.image = data?.img
            lbl.text = data?.titleStr
        }
    }
}

