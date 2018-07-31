//
//  Triangle.swift
//  PythagoreanTheorem
//
//  Created by Sam Dindyal on 2018-07-30.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Triangle {
    
    var a:Float {
        didSet {
            recalculateSides()
        }
    }
    
    var b:Float {
        didSet {
            recalculateSides()
        }
    }
    
    var c:Float
    
    var shapePath: UIBezierPath
    
    var bounds: CGRect!
    
    
    init(a: Float, b: Float) {
        self.a = a
        self.b = b
        
        self.c = sqrtf(powf(self.a, 2) + powf(self.b, 2))
        
        self.shapePath = UIBezierPath()
    }
    
    func recalculateSides() {
        self.c = sqrtf(powf(self.a, 2) + powf(self.b, 2))
    }
    
    
    func calculateShapePaths(bounds: CGRect) {
        if self.a > 0, self.b > 0, self.c > 0
        {
            let lineWidth:CGFloat = 5.0
        
            let heightRatio = CGFloat(self.a) / bounds.height
            let widthRatio = CGFloat(self.b) / bounds.width
        
            let sizeRatio = max(heightRatio, widthRatio)
        
            let width = (CGFloat(self.b) / sizeRatio) - lineWidth - 10
            let height = (CGFloat(self.a) / sizeRatio) - lineWidth - 10
        
            let shapePath = UIBezierPath()
            let startingPoint = CGPoint(x: (bounds.width - width)/2.0 + 10 + lineWidth,
                                        y: (bounds.height - height) + 10 + lineWidth)
            shapePath.lineWidth = lineWidth
        
            shapePath.move(to: startingPoint)
            shapePath.addLine(to: CGPoint(x: shapePath.currentPoint.x, y: height))
            shapePath.addLine(to: CGPoint(x: width, y: shapePath.currentPoint.y))
            shapePath.addLine(to: startingPoint)
        
            self.shapePath = shapePath
        } else {
            self.shapePath = UIBezierPath()
        }
        
        self.bounds = bounds
    }
    
    func calculateShapePaths() {
        self.calculateShapePaths(bounds: self.bounds)
    }
    
    
}
