//
//  Triangle.swift
//  PythagoreanTheorem
//
//  Created by Sam Dindyal on 2018-07-30.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Triangle {
    
    var a:Float
    var b:Float
    var c:Float
    
    var shapePath: UIBezierPath
    
    var bounds: CGRect!
    
    
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
        
        self.shapePath = UIBezierPath()
    }
    
    func recalculateSides(a:Float) {
        self.a = a
        self.c = sqrtf(powf(self.a, 2) + powf(self.b, 2))
    }
    
    func recalculateSides(b:Float) {
        self.b = b
        self.c = sqrtf(powf(self.a, 2) + powf(self.b, 2))
    }
    
    func recalculateSides(c:Float, b:Float) {
        self.c = c
        self.b = b
        
        self.a = sqrtf(powf(self.c, 2) - powf(self.b, 2))    }
    
    func calculateShapePaths(bounds: CGRect) {
        
        let lineWidth:CGFloat = 5.0
        
        let heightRatio = CGFloat(self.a) / bounds.height
        let widthRatio = CGFloat(self.b) / bounds.width
        
        let sizeRatio = max(heightRatio, widthRatio)
        
        let width = CGFloat(self.b) / sizeRatio
        let height = CGFloat(self.a) / sizeRatio
        
        let shapePath = UIBezierPath()
        let startingPoint = CGPoint(x: (bounds.width - width)/2.0 + 10 + lineWidth,
                                    y: (bounds.height - height) + 10 + lineWidth)
        shapePath.lineWidth = lineWidth
        
        shapePath.move(to: startingPoint)
        shapePath.addLine(to: CGPoint(x: shapePath.currentPoint.x, y: shapePath.currentPoint.y + CGFloat(self.a)))
        shapePath.addLine(to: CGPoint(x: shapePath.currentPoint.x + CGFloat(self.b), y: shapePath.currentPoint.y))
        shapePath.addLine(to: startingPoint)
        
        self.shapePath = shapePath
        self.bounds = bounds
    }
    
    func calculateShapePaths() {
        self.calculateShapePaths(bounds: self.bounds)
    }
    
    
}
