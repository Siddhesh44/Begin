//
//  RangeSliderThumbLayer.swift
//  Begin
//
//  Created by Siddhesh jadhav on 06/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit

class RangeSliderThumbLayer: CALayer {
    var highlighted = false
    weak var rangeSlider: RangeSlider?
    
    override func draw(in ctx: CGContext) {
        if let slider = rangeSlider {
            let thumbFrame = bounds.insetBy(dx: 2.0, dy: 2.0)
            let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
            let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)
            
            ctx.setFillColor(slider.thumbTintColor)
            ctx.addPath(thumbPath.cgPath)
            ctx.fillPath()
            
            if highlighted {
                ctx.setFillColor(Colors.darkerShadeOfOrange.cgColor)
                ctx.addPath(thumbPath.cgPath)
                ctx.fillPath()
            }
        }
    }
}

class RangeSliderThumbLayer1: CALayer {
    weak var rangeSlider: RangeSlider?
    var highlighted = false
    override func draw(in ctx: CGContext) {
        if let slider = rangeSlider {
            let thumbFrame = bounds.insetBy(dx: 2.0, dy: 2.0)
            let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
            let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)
            
            ctx.setFillColor(slider.upperThumbTintColor)
            ctx.addPath(thumbPath.cgPath)
            ctx.fillPath()
            
            if highlighted {
                ctx.setFillColor(Colors.lighterShadeOfOrange.cgColor)
                ctx.addPath(thumbPath.cgPath)
                ctx.fillPath()
            }
        }
    }
}
