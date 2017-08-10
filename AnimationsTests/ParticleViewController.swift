//
//  ParticleViewController.swift
//  AnimationsTests
//
//  Created by Олег Рекша on 01.08.17.
//  Copyright © 2017 Олег Рекша. All rights reserved.
//

import UIKit

class ParticleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       createParticles()
    }
 let emiter = CAEmitterLayer()

    func createParticles(){
        emiter.name = "name"
        emiter.emitterPosition = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2 )
        emiter.emitterSize = CGSize(width: 50 , height: 50)
        emiter.emitterCells = createCells()
        emiter.emitterShape = kCAEmitterLayerCircle
        emiter.emitterMode = kCAEmitterLayerOutline
         let animation = CABasicAnimation(keyPath: "emitterCells.cell.emissionLongitude")
        animation.fromValue = 0
        let to_val:CGFloat = (360 * (.pi / 180))
        animation.toValue = to_val
        animation.duration = 0.7
        animation.repeatCount = .infinity
        emiter.add(animation, forKey: nil)
        
        let animation2 = CABasicAnimation(keyPath: "emitterCells.cell.yAcceleration")
        animation2.fromValue = -300
        animation2.toValue = 300
        animation2.duration = 0.7
        animation2.repeatCount = .infinity
       // emiter.add(animation2, forKey: nil)


        view.layer.addSublayer(emiter)
        
    }
    
    func createCells() ->[CAEmitterCell]{
        var cells = [CAEmitterCell]()
        
        let  cell = CAEmitterCell()
        cell.contents  = #imageLiteral(resourceName: "arc").cgImage
        cell.name = "cell"
        cell.lifetime = 5
        cell.velocity = CGFloat(5)
        cell.scale = 0.1
        cell.scaleRange = 0.3
        cell.spin = (180 * (.pi / 180))
        
        cell.birthRate = 200
        cell.alphaSpeed = 0.1
        cell.alphaRange = 0
        cell.color = UIColor.cyan.cgColor
        cells.append(cell)
               return cells
    }
  
}
