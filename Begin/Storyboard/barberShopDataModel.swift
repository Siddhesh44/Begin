//
//  barberShopDataModel.swift
//  Begin
//
//  Created by Siddhesh jadhav on 28/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

class Services{
    var servicesImage: UIImage
    var serviceTitle: String
    var servicesPlaces: String
    
    init(servicesImage:UIImage,serviceTitle: String,servicesPlaces: String) {
        self.servicesImage = servicesImage
        self.serviceTitle = serviceTitle
        self.servicesPlaces = servicesPlaces
    }
}

class Shops{
    var shopImage: UIImage
    var shopName: String
    var shopAddress: String
    var shopStarPoint: String
    
    init(shopImage: UIImage,shopName: String,shopAddress: String,shopStarPoint: String)
    {
        self.shopImage = shopImage
        self.shopName = shopName
        self.shopAddress = shopAddress
        self.shopStarPoint = shopStarPoint
    }
}

class Cards{
    var cardImage: UIImage
    var cardName: String
    var cardAddress: String
    var cardStarPoint: String
    
    init(cardImage: UIImage,cardName: String,cardAddress: String,cardStarPoint: String)
    {
        self.cardImage = cardImage
        self.cardName = cardName
        self.cardAddress = cardAddress
        self.cardStarPoint = cardStarPoint
    }
}

class SortBy{
    var sortList: String
    
    init(sortListItem: String) {
        self.sortList = sortListItem
    }
}
