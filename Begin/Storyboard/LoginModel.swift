//
//  loginModel.swift
//  Begin
//
//  Created by Siddhesh jadhav on 16/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class LoginModel {
    var email: String?
    var userType: String?
    var country: String?
    var error: Bool?
    var deviceToken: [Any]?
    
    init(loginData: JSON) {
        self.email = loginData["obj"]["email"].stringValue
        self.error = loginData["obj"]["error"].boolValue
        self.deviceToken = loginData["obj"]["device_token"].arrayValue
    }
}
