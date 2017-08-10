//
//  overrides.swift
//  AnimationsTests
//
//  Created by Олег Рекша on 28.07.17.
//  Copyright © 2017 Олег Рекша. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RadialGradientView: UIView {
    
    @IBInspectable var InsideColor: UIColor = UIColor.clear
    @IBInspectable var OutsideColor: UIColor = UIColor.clear
    @IBInspectable var RoundetCorners: Bool = false
    override func draw(_ rect: CGRect) {
        let colors = [InsideColor.cgColor, OutsideColor.cgColor] as CFArray
        let endRadius = min(frame.width, frame.height) / 2
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        if RoundetCorners {
            self.clipsToBounds = true
            self.layer.cornerRadius = min( bounds.size.width, bounds.size.height) / 2
        }
    }
}


@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var CornerRadius: CGFloat = 0
  
    var data:Any?
    override func draw(_ rect: CGRect) {
        self.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        self.layer.cornerRadius = CornerRadius
        self.clipsToBounds = true
    }
}

