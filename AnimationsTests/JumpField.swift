//
//  JumpField.swift
//  AnimationsTests
//
//  Created by Олег Рекша on 31.07.17.
//  Copyright © 2017 Олег Рекша. All rights reserved.
//

import UIKit

class JumpField: UIButton, UITextFieldDelegate {

    @IBInspectable var JumpWidht:CGFloat = CGFloat(200)
    @IBInspectable var ButtonColor:UIColor = UIColor.black
    @IBInspectable var ButtonTextColor:UIColor = UIColor.white
    @IBInspectable var ButtonText:String = "Open"
    @IBInspectable var TextPlaceholder:String = ""
    @IBInspectable var ButtonActionText:String = "Search"
    @IBInspectable var ButtonCloseText: String = "Hide"
    let button = RoundButton()
    let text = UITextField()
    var opened = false
    
    
    override func draw(_ rect: CGRect) {
        button.frame.size = self.frame.size
        button.frame.origin = CGPoint(x: 0, y: 0)
        button.backgroundColor = ButtonColor
        button.setTitleColor(ButtonTextColor, for: .normal)
        
        button.setTitle(ButtonText, for: .normal)
        button.CornerRadius = 5
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        text.frame = CGRect(x: 0, y: 2, width: 0, height: button.frame.size.height - 4)
        text.borderStyle = .roundedRect
        text.placeholder = TextPlaceholder
        text.delegate = self
        text.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
        self.addSubview(text)
        self.addSubview(button)

    }

    func buttonClick(){
        if (!opened){
            openTextField()
        }
        if(opened && (text.text?.isEmpty)!){
            hideTextField()
        }
        if (opened && !(text.text?.isEmpty)!){
          
        }
    }
    
    func textFieldChanged(_ textField: UITextField)  {
        if (textField.text?.isEmpty)!{
            button.setTitle(ButtonCloseText, for: .normal)
        }else{
            button.setTitle(ButtonActionText, for: .normal)
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty)!{
            button.setTitle(ButtonCloseText, for: .normal)
        }else{
             button.setTitle(ButtonActionText, for: .normal)
        }
    }
    func openTextField(){
        UIView.animate(withDuration: 0.4, animations: {
            self.frame.size.width += self.JumpWidht
            self.button.frame.size.width += self.JumpWidht
        }, completion: { (_) in
            UIView.animate(withDuration: 0.4,  animations: {
                self.button.center.x += self.JumpWidht
                self.text.frame.size.width += self.JumpWidht - 8
                self.button.frame.size.width -= self.JumpWidht
            }, completion: { (_) in
                self.opened = true
                self.text.becomeFirstResponder()
                self.button.setTitle(self.ButtonCloseText, for: .normal)
            })
        })

    }
    
    func hideTextField(){
              UIView.animate(withDuration: 0.4, animations: {
                self.button.frame.size.width += self.JumpWidht
                self.button.center.x -= self.JumpWidht
                self.text.frame.size.width = 0
                
            }, completion: { (_) in
                UIView.animate(withDuration: 0.4,  animations: {
                    self.button.frame.size.width -= self.JumpWidht
                    self.frame.size.width -= self.JumpWidht
                }, completion: { (_) in
                    self.opened = false
                    self.text.resignFirstResponder()
                     self.button.setTitle(self.ButtonText, for: .normal)
                })
            })
    }
    

}
