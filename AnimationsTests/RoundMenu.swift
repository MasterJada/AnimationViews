//
//  RoundMenu.swift
//  AnimationsTests
//
//  Created by Олег Рекша on 01.08.17.
//  Copyright © 2017 Олег Рекша. All rights reserved.
//

import UIKit
@IBDesignable
class RoundMenu: UIView {
    @IBInspectable var Round: Bool = false
    @IBInspectable var backColor: UIColor? = UIColor.white
    @IBInspectable var Text: String = "Menu"
    @IBInspectable var TextColor: UIColor = UIColor.white
    @IBInspectable var ItemsColor: UIColor = UIColor.white
    var topCenter:CGPoint?
    var opened:Bool = false
    let roundButton = RoundButton()
    let bottomView = UIView()
    let menuItemsView = UIView()
    var items = [RoundButton]()
    override func draw(_ rect: CGRect) {
        
            self.bottomView.layer.cornerRadius = min (self.frame.width, self.frame.height) / 2
            self.bottomView.clipsToBounds = true
            self.bottomView.layer.shadowOpacity = 1
            self.bottomView.frame.size = self.frame.size
            self.bottomView.center = CGPoint(x: self.frame.width/2, y: self.frame.height / 2)
            self.bottomView.backgroundColor = backColor?.withAlphaComponent(0.4)
        
        self.addSubview(bottomView)
        self.menuItemsView.frame.size = self.frame.size
        self.menuItemsView.center = CGPoint(x: self.frame.width/2, y: self.frame.height / 2)
       
        self.addSubview(menuItemsView)
        
        roundButton.frame.size = self.bottomView.frame.size
        roundButton.center = CGPoint(x: self.roundButton.frame.width/2, y: self.roundButton.frame.height / 2)
        roundButton.setTitle(Text, for: .normal)
        roundButton.setTitleColor(TextColor, for: .normal)
        roundButton.backgroundColor = backColor
        roundButton.CornerRadius = self.bottomView.frame.width/2
        roundButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
  
        self.addSubview(roundButton)
        items.forEach({
            $0.center = self.menuItemsView.center
            self.menuItemsView.addSubview($0)
        })
        items.forEach({$0.addTarget(self, action: #selector(itemClicked(_:)), for: .touchUpInside)})
    }
    
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.bottomView.addSubview(blurEffectView)
    }
    
    
    func itemClicked(_ sender: RoundButton){
    UIView.animate(withDuration: 0.2, delay: 0,  options: .autoreverse, animations: { 
        sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        sender.alpha = 0.4

    }, completion: {_ in
        sender.transform = .identity
        sender.alpha = 1
       self.buttonClicked()
    })
        
    }
    
    func buttonClicked(){
        if (opened){
            closeMenu()
        }else{
            openMenu()
        }
    }
    func openMenu(){
       self.menuItemsView.alpha = 1
        
        UIView.animate(withDuration: 0.2,  animations: {
            self.bottomView.transform = CGAffineTransform(scaleX: 3, y: 3)
            
        }, completion: { _ in
           
            self.opened = true
          
            self.menuItemsView.frame.size = self.bottomView.frame.size
            self.menuItemsView.frame.origin = self.bottomView.frame.origin
            self.bounds = self.bottomView.frame
            self.sizeToFit()
          self.drawCirclePoints(buttons: self.items, radius: self.menuItemsView.frame.width / 3, center: CGPoint(x: self.bottomView.frame.width / 2, y: self.bottomView.frame.width/2))
                  })
        
    }
    func closeMenu(){
      
        self.bounds = self.roundButton.bounds
        self.frame.size = self.roundButton.frame.size
        self.sizeToFit()
        
        menuItemsView.subviews.forEach({view in
        UIView.animate(withDuration: 0.2, animations: { 
            view.center = CGPoint(x: self.menuItemsView.frame.width / 2, y: self.menuItemsView.frame.width/2)
            view.alpha = 0
        }, completion:nil)
        })

        UIView.animate(withDuration: 0.4,  animations: {
           self.bottomView.transform = .identity
        }, completion: { _ in
            self.opened = false
           self.menuItemsView.alpha = 0
            })

    }
    
    func  drawCirclePoints(buttons: [RoundButton], radius: CGFloat, center: CGPoint)
    {
    let  slice =  2 * CGFloat.pi / CGFloat( buttons.count)
    var  i  = 0.0
    for  btn in buttons {
    let angle = slice * CGFloat(i)
    
    let newX = (center.x + radius * cos(angle));
    let newY = (center.y + radius * sin(angle));
    let p = CGPoint(x: newX, y: newY)
    btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    btn.tintColor = self.tintColor
    btn.CornerRadius = 15
    btn.center = center
    btn.backgroundColor = ItemsColor
        UIView.animate(withDuration: 0.2, delay: TimeInterval(Double(i) * 0.05),  animations: {
            btn.center = p
            btn.alpha = 1
        }, completion: nil)
   
        i += 1

    }
    
    }
}
