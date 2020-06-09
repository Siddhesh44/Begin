//
//  BarberShopAPIHelper.swift
//  Begin
//
//  Created by Siddhesh jadhav on 18/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol BarberShopAPIDelegate: class {
    func loginIntoApp(data: BarberShopLoginModel)
    func loginStatus(message: String)
}

class BarberShopAPIHelper {
    weak var barberShopDelegate: BarberShopAPIDelegate?
    var shopData = barberShopData()
    
    func appLoginRequest(email: String,pass: String){
        Spinner.start()
        let parameters: [String: Any] = ["email": email, "password": pass, "deviceToken": "fgdvsdgvdfsgvefr", "user_type": "employer", "agency_id": "5e15a4df13de410c28587583"]
        
        AF.request("https://intervid.infiny.dev/users/login",method: .post,parameters: parameters).validate().responseJSON { (response) in
            print("response from API:- ",response)
            switch response.result{
            case .success(let values):
                print("")
                let json = JSON(values)
                print("json:- \n",json)
                let model = BarberShopLoginModel(data: json)
                if let data = values as? Dictionary<String,AnyObject>{
                    let resulValue = data as NSDictionary
                    let code = resulValue["errcode"] as? Int
                    if code == 0{
                        let token = model.token
                        UserDefaults.standard.set(token, forKey: "userToken")
                        self.barberShopDelegate?.loginIntoApp(data: model)
                        Spinner.stop()
                    }
                    else if code == 200{
                        Spinner.stop()
                        print("Error Ocuures during login:-", model.message!)
                    }
                }
            case .failure(let error):
                print("")
                Spinner.stop()
                self.barberShopDelegate?.loginStatus(message: "Error:- \n \(error)")
            }
        }
        
    }
    
    
    func getList(){
        let token = shopData.fetchToken()
        let params: [String : Any] = ["userToken": token, "user_type": "employer", "requestData": 1, "agency_id": "5e15a4df13de410c28587583"]
        AF.request("https://intervid.infiny.dev/users/notificationListing",method: .post,parameters: params).responseJSON { (response) in
            switch response.result{
            case .success(let values):
                print("Success:-",values)
            case .failure(let error):
                print("Falied:-",error)
            }
        }
    }
}
