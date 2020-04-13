//
//  alamofireViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 08/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import Alamofire

class alamofireViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        AF.download("https://httpbin.org/image/png")
        .downloadProgress { progress in
            print("Download Progress: \(progress.fractionCompleted)")
        }
        .responseData { response in
            if let data = response.value {
                let image = UIImage(data: data)
            }
        }

       
    }
}
