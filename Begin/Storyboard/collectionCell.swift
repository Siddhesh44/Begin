//
//  categoriesCollectionCell.swift
//  Begin
//
//  Created by Siddhesh jadhav on 27/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class categoriesCollectionCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var places: UILabel!
    
    func setCategories(data: Services){
        categoryImageView.image = data.servicesImage
        title.text = data.serviceTitle
        places.text = data.servicesPlaces
    }
}

class shopCollectionCell: UICollectionViewCell{
    @IBOutlet weak var bestSalonView: UIView!
    @IBOutlet weak var bookBtn: UIButton!
    
    @IBOutlet weak var salonNameLbl: UILabel!
    @IBOutlet weak var salonAddressLbl: UILabel!
    @IBOutlet weak var salonStarPointLbl: UILabel!
    @IBOutlet weak var salonImage: UIImageView!
    
    override func awakeFromNib() {
    bestSalonView.roundedView1()
    bookBtn.roundCorners(corners: [.topLeft], radius: 8)
   }
    
    func setShops(data: Shops){
        salonImage.image = data.shopImage
        salonAddressLbl.text = data.shopAddress
        salonNameLbl.text = data.shopName
        salonStarPointLbl.text = data.shopStarPoint
    }
}


class mapCardCollectionCell: UICollectionViewCell{
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var bookBtn: UIButton!
    
    @IBOutlet weak var cardNameLbl: UILabel!
    @IBOutlet weak var cardAddressLbl: UILabel!
    @IBOutlet weak var cardStarPointLbl: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func awakeFromNib() {
    cardView.roundedView1()
    bookBtn.roundCorners(corners: [.topLeft], radius: 8)
   }
    
    func setCard(data: Cards){
        cardImage.image = data.cardImage
        cardAddressLbl.text = data.cardAddress
        cardNameLbl.text = data.cardName
        cardStarPointLbl.text = data.cardStarPoint
    }
}


