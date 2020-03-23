//
//  collectionViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 16/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class collectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var data = ["🦙","🦛","🦘","🦧","🦢","🦜","🦞","🦡","🦥","🦦","🦨","🦩","🦮","🐕‍🦺","🐘"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Reuse", for: indexPath) as! newCollectionViewCell
        
        cell.animalLabel.text = self.data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let trywidth = collectionView.bounds.size.width/4
        let tryheigth = collectionView.bounds.size.height/10
        
        return CGSize(width: trywidth, height: tryheigth)
    }
    
    
    
    
    
    
}
