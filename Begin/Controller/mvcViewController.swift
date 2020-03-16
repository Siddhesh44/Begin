//
//  mvcViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 14/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit


class mvcViewController: UIViewController {

    var arrData = [mvcModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrData = mvcData.getAllMvcData()
        
    }

}

extension mvcViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Reuse", for: indexPath) as! mvcCollectionViewCell
        
        cell.data = arrData[indexPath.row]
       
        
        return cell
        
    }
}
