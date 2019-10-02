//
//  Emitter.swift
//  ex02
//
//  Created by Ramirez Family on 10/1/19.
//  Copyright © 2019 XcodePiscine. All rights reserved.
//

import UIKit
class Emitter {
    
    static func get(with image: UIImage, n1: Float) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterCells = generateEmitterCells(with: image, n1: n1)
        
        return emitter
    }
    static func generateEmitterCells(with image: UIImage, n1: Float) -> [CAEmitterCell]{
        
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = n1
        cell.lifetime = n1
        cell.velocity = CGFloat(-100)
        cell.emissionRange = CGFloat(45 * (Double.pi/180))
        cell.scale = 0.7
        cell.scaleRange = 0.6
        
        cells.append(cell)
        
        return cells
    }
}
