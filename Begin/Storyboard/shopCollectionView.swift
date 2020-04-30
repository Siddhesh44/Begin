//
//  shopCollectionView.swift
//  Begin
//
//  Created by Siddhesh jadhav on 27/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class shopCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    override func awakeFromNib() {
           self.delegate = self
           self.dataSource = self
       }
       
       func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 3
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopsCell", for: indexPath) as! shopCollectionCell
        cell.setShops(data: salonShops[indexPath.row])
           return cell
           
       }
}
