//
//  barberShopData.swift
//  Begin
//
//  Created by Siddhesh jadhav on 28/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

var categories: [Services] = [
    Services(servicesImage: #imageLiteral(resourceName: "salon"), serviceTitle: "Salon", servicesPlaces: "85 Places"),
    Services(servicesImage: #imageLiteral(resourceName: "haircut"), serviceTitle: "Haircut", servicesPlaces: "126 Places"),
    Services(servicesImage: #imageLiteral(resourceName: "styling"), serviceTitle: "Styling", servicesPlaces: "18 Places"),
    Services(servicesImage: #imageLiteral(resourceName: "snampoo"), serviceTitle: "Snampoo", servicesPlaces: "20 Places"),
    Services(servicesImage: #imageLiteral(resourceName: "coloring"), serviceTitle: "Coloring", servicesPlaces: "50 Places"),
    Services(servicesImage: #imageLiteral(resourceName: "MakeUp"), serviceTitle: "Makeup", servicesPlaces: "60 Places"),
    Services(servicesImage: #imageLiteral(resourceName: "hairdryer"), serviceTitle: "Hairdryer", servicesPlaces: "85 Places")
]


var salonShops: [Shops] = [
    Shops(shopImage: #imageLiteral(resourceName: "RedBox Barber"), shopName: "RedBox Barber", shopAddress: "288 McClure Court, Arkansas", shopStarPoint: "4.0"),
    Shops(shopImage: #imageLiteral(resourceName: "looks Unisex salon"), shopName: "Looks Unisex Salon", shopAddress: "85 McClure Court, Arkansas", shopStarPoint: "3.5"),
    Shops(shopImage: #imageLiteral(resourceName: "beauty plus spa"), shopName: "Beauty Plus Spa", shopAddress: "34 McClure Court, Arkansas", shopStarPoint: "4.0")
]

var mapCards: [Cards] = [
    Cards(cardImage: #imageLiteral(resourceName: "RedBox Barber"), cardName: "RedBox Barber", cardAddress: "288 McClure Court, Arkansas", cardStarPoint: "4.0"),
    Cards(cardImage: #imageLiteral(resourceName: "looks Unisex salon"), cardName: "Looks Unisex Salon", cardAddress: "85 McClure Court, Arkansas", cardStarPoint: "3.5"),
    Cards(cardImage: #imageLiteral(resourceName: "beauty plus spa"), cardName: "Beauty Plus Spa", cardAddress: "34 McClure Court, Arkansas", cardStarPoint: "4.0")
]

var sortByList: [SortBy] = [SortBy(sortListItem: "Most Popular"),
                             SortBy(sortListItem: "Cost Low to High"),
                             SortBy(sortListItem: "Cost High to Low")
]



class barberShopData{
    
    func fetchToken() -> String{
        if let token = UserDefaults.standard.value(forKey: "userToken") as? String{
            print("fetched_token", token)
            return token
        }else{
            print("token is nil")
            return ""
        }
    }
    
}








