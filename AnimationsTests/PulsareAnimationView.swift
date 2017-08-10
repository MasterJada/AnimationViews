//
//  PulsareAnimation.swift
//  AnimationsTests
//
//  Created by Олег Рекша on 28.07.17.
//  Copyright © 2017 Олег Рекша. All rights reserved.
//

import UIKit

class PulsareAnimationView: UIView {

    @IBInspectable var InsideColor: UIColor = UIColor.white
    @IBInspectable var OutsideColor: UIColor = UIColor.clear
    @IBInspectable var Image: UIImage? 
    override func draw(_ rect: CGRect){
       super.draw(rect)
        UIGraphicsGetCurrentContext()?.clear(rect)
        if Image == nil {
            return
        }
        
        let imageView = UIImageView()
        imageView.bounds.size = CGSize(width: bounds.size.width, height: bounds.height)
        imageView.frame.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        imageView.center = CGPoint(x: self.frame.width/2, y: self.frame.height / 2 )
        
        imageView.image = Image
        self.addSubview(imageView)
    }
    
    
    func startAnimation(scale: Double = 0, duration: Double = 1, circleCount: Int){
        for i in 0...circleCount{
            let view = Wave()
            view.InsideColor = self.InsideColor
            view.OutsideColor = self.OutsideColor
            view.clipsToBounds = true
            view.layer.cornerRadius = min( bounds.size.width - 30, bounds.size.height - 30) / 2
            view.bounds = self.bounds
            view.bounds.size = CGSize(width: bounds.size.width - 30, height: bounds.height - 30)
            view.frame.size = CGSize(width: self.frame.size.width - 30, height: self.frame.size.height - 30)
            view.center = CGPoint(x: self.frame.width/2, y: self.frame.height / 2 )
           
            let delay =  Double(i) / Double(circleCount) * 2
            view.startAnimation(scale: scale, duration: duration, delay: delay)
            self.addSubview(view)
        }
        if Image == nil {
            return
        }
        
        let imageView = UIImageView()
        imageView.bounds.size = CGSize(width: bounds.size.width, height: bounds.height)
        imageView.frame.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        imageView.center = CGPoint(x: self.frame.width/2, y: self.frame.height / 2 )
        
        imageView.image = Image
        self.addSubview(imageView)
    }

}

class  Wave: UIView {
    
     var InsideColor: UIColor = UIColor.clear
     var OutsideColor: UIColor = UIColor.clear
  
    override func draw(_ rect: CGRect) {
        let colors = [InsideColor.cgColor, OutsideColor.cgColor] as CFArray
        let endRadius = min(frame.width, frame.height) / 2
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        
    }
    func startAnimation(scale: Double = 0, duration: Double = 1, delay: Double = 0){
        UIView.animate(withDuration: duration, delay: delay, options: .repeat, animations: {
            self.transform = CGAffineTransform(scaleX: CGFloat(scale), y: CGFloat(scale))
            self.alpha = 0
            
        }) { end in
            
        }
    }
}
