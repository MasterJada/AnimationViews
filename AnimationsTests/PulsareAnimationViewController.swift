//
//  PulsareAnimationViewController.swift
//  AnimationsTests
//
//  Created by Олег Рекша on 28.07.17.
//  Copyright © 2017 Олег Рекша. All rights reserved.
//

import UIKit

class PulsareAnimationViewController: UIViewController {
    @IBOutlet weak var pulsare: PulsareAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pulsare.startAnimation(scale: 4, duration: 2, circleCount: 3)
    }

    @IBAction func clickImage(_ sender: PulsareAnimationView) {
        sender.OutsideColor = UIColor.red
        sender.Image = #imageLiteral(resourceName: "heard")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
