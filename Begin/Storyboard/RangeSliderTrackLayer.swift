//
//  RangeSliderTrackLayer.swift
//  Begin
//
//  Created by Siddhesh jadhav on 06/05/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class RangeSliderTrackLayer: CALayer {
    weak var rangeSlider: RangeSlider?
    
    override func draw(in ctx: CGContext) {
        if let slider = rangeSlider {
            // Clip
            let cornerRadius = bounds.height * slider.curvaceousness / 2.0
            let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            ctx.addPath(path.cgPath)
            
            // Fill the track
            ctx.setFillColor(slider.trackTintColor.cgColor)
            ctx.addPath(path.cgPath)
            ctx.fillPath()
            
            // Fill the highlighted range
            // ctx.setFillColor(slider.trackHighlightTintColor)
            let lowerValuePosition =  CGFloat(slider.positionForValue(value: slider.lowerValue))
            let upperValuePosition = CGFloat(slider.positionForValue(value: slider.upperValue))
            
            //            let rect = CGRect(x: lowerValuePosition, y: 0.0, width: upperValuePosition - lowerValuePosition, height: bounds.height)
            
            let colors = [Colors.darkerShadeOfOrange.cgColor, Colors.lighterShadeOfOrange.cgColor] as CFArray
            
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colorLocations: [CGFloat] = [0.0 ,1.0]
            
            let startPoint = CGPoint(x: lowerValuePosition, y: 0)
            let endPoint = CGPoint(x: upperValuePosition - lowerValuePosition + 5, y: 0)
            
            let gradient = CGGradient(colorsSpace: colorSpace,
                                      colors: colors as CFArray,
                                      locations: colorLocations)!
            ctx.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
            // ctx.fill(rect)
        }
    }
}
