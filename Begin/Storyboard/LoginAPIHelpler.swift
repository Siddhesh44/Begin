//
//  loginAPIHelpler.swift
//  Begin
//
//  Created by Siddhesh jadhav on 16/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



protocol abc: class {
    func show(data: LoginModel)
}


class LoginAPIHelper{
    
    weak var showDelegate: abc?
    
    func loginRequest(email: String,pass: String){
        
        var parameters: [String: Any] = ["email": email, "password": pass, "deviceToken": "fgdvsdgvdfsgvefr", "user_type": "employer"]
        parameters["agency_id"] = "5e15a4df13de410c28587583"
        
        AF.request("https://intervid.infiny.dev/users/login",method: .post,parameters: parameters).validate().responseJSON { (response) in
            switch response.result{
            case .success(let values):
                if let data = values as? Dictionary<String,AnyObject>
                {
                    let resultValue = data as NSDictionary
                        let code = resultValue["errcode"] as? Int
                    if code == 0
                    {
                        let json = JSON(values)
                        print("api data \n ",json)
                        let loginModel = LoginModel(loginData: json)
                        self.showDelegate?.show(data: loginModel)
                    }
                    else
                    {
                        print("error")
                    }
                }
            case .failure(_):
                print("login falied")
            }
        }
    }
}
