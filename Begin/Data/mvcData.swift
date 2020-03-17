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
            mvcModel(img: #imageLiteral(resourceName: "img2"), titleStr: "Image 1"),
            mvcModel(img: #imageLiteral(resourceName: "img1"), titleStr: "Image 2"),
            mvcModel(img: #imageLiteral(resourceName: "img3"), titleStr: "Image 3")
        ]
        return arrData
    }
}
