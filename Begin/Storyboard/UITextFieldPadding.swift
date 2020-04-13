//
//  UITestFieldPadding.swift
//  Begin
//
//  Created by Siddhesh jadhav on 07/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

class UITextFieldPadding : UITextField {
  let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
