//
//  baraberShopInboxVc.swift
//  Begin
//
//  Created by Siddhesh jadhav on 13/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit

class baraberShopInboxVc: UIViewController {

    var barberShopApiHelper = BarberShopAPIHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
    
      
        
        barberShopApiHelper.getList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

