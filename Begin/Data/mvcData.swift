//
//  mvcData.swift
//  Begin
//
//  Created by Siddhesh jadhav on 14/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

class mvcData
{
   static func getAllMvcData() -> [mvcModel]
    {
        var arrData = [mvcModel]()
        arrData = [
            mvcModel(img: (UIImage(named: "img1") ?? nil)!, titleStr: "Image 1"),
            mvcModel(img: (UIImage(named: "img2") ?? nil)!, titleStr: "Image 2"),
            mvcModel(img: (UIImage(named: "img3") ?? nil)!, titleStr: "Image 3")
        ]
        return arrData
    }
}
