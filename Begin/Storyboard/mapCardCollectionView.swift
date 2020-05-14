//
//  mapCardCollectionView.swift
//  Begin
//
//  Created by Siddhesh jadhav on 11/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class mapCardCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource{
    
    override func awakeFromNib() {
              self.delegate = self
              self.dataSource = self
          }
          
          func numberOfSections(in collectionView: UICollectionView) -> Int {
              return 1
          }
          func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return mapCards.count
          }
          
          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardsCell", for: indexPath) as! mapCardCollectionCell
            cell.setCard(data: mapCards[indexPath.row])
              return cell
              
          }
    
}

