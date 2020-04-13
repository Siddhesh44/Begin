//
//  swiftyJSONExViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 11/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class swiftyJSONExViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://httpbin.org/json").response { (response) in
            switch response.result{
            case .success(let value):
                // print(value)
                let json = JSON(value)
                print(json)
                
                // optional value
                let slideShow = json["slideshow"]["title"].string
                print(slideShow)
                
                // non optional value
                let slideShow1 = json["slideshow"]["author"].stringValue
                print(slideShow1)
                
                // check whether value exixts or not
                print(json["slideshow"]["date"].exists())
                
                // printing array
                
                let slides = json["slideshow"]["slides"].arrayValue
                for slides in slides{
                    print(slides)
                }
                
                print("########################")
                
                // elements of array
                
                let slideTitle = json["slideshow"]["slides"][0].dictionaryValue
                print(slideTitle)
                print("########################")
                
                let slideTitle1 = json["slideshow"]["slides"][1].dictionaryValue
                print(slideTitle1)
                print("########################")
                
                // error handling
                if let slideTitle2 = json["slideshow"]["slides"][2].dictionary{
                    print(slideTitle2)
                }
                else{
                    print(json["slideshow"]["slides"][2].error)
                }
                print("########################")
                
                
                let type = json["slideshow"]["slides"][1]["title"].stringValue
                print(type)
                print("########################")
                
                let items = json["slideshow"]["slides"][1]["items"].arrayValue
                for items in items{
                    print(items)
                }
                print("########################")
            case .failure(_):
                print("error")
            }
        }
        
        
    }
}
