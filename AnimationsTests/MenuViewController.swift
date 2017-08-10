//
//  MenuViewController.swift
//  AnimationsTests
//
//  Created by Олег Рекша on 01.08.17.
//  Copyright © 2017 Олег Рекша. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var menuButton: RoundMenu!
    
    var startCenter:CGPoint? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        startCenter = menuButton.center
        let twitterButton = RoundButton()
        twitterButton.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
        twitterButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        twitterButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        twitterButton.data = "Twitter"
        menuButton.items.append(twitterButton)
        
        let linkedinIcon = RoundButton()
        linkedinIcon.setImage(#imageLiteral(resourceName: "linkedin"), for: .normal)
         linkedinIcon.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
         linkedinIcon.isUserInteractionEnabled = true
        linkedinIcon.data = "LinkedIn"
        menuButton.items.append(linkedinIcon)
        
        let facebookIcon = RoundButton()
        facebookIcon.setImage(#imageLiteral(resourceName: "fbicon"), for: .normal)
        facebookIcon.data = "Facebook"
        facebookIcon.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        menuButton.items.append(facebookIcon)
        
        let instaIcon = RoundButton()
        instaIcon.setImage(#imageLiteral(resourceName: "instagramm"), for: .normal)
        instaIcon.data = "Instagram"
        instaIcon.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        menuButton.items.append(instaIcon)
        
        let youIcon = RoundButton()
        youIcon.setImage(#imageLiteral(resourceName: "youtube"), for: .normal)
        youIcon.data = "YouTube"
        youIcon.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        menuButton.items.append(youIcon)
       
      
    }

    
    func buttonClick(_ sender: RoundButton){
        print(sender.data!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func swiped(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .recognized  && sender.direction == .up{
            UIView.animate(withDuration: 0.2, animations: {
             
                self.menuButton.center = self.view.center
            })
            menuButton.openMenu()
        }
        if sender.state == .recognized  && sender.direction == .down{
            UIView.animate(withDuration: 0.2, animations: {
                
                self.menuButton.center = self.startCenter!
            })
            menuButton.closeMenu()
        }
        
        
       
    }
    
    

}
