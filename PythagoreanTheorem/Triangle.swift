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
    
    var shapePaths: [UIBezierPath]
    
    var bounds: CGRect!
    
    var formulae: [String : String] = []
    
    
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
        
        self.shapePaths = []
    }
    
    func recalculateSides(a:Float) {
        self.a = a
        self.c = sqrt(powf(self.a, 2), powf(self.b, 2))
    }
    
    func recalculateSides(b:Float) {
        self.b = b
        self.c = sqrt(powf(self.a, 2) + powf(self.b, 2))
    }
    
    func recalculateSides(c:Float, b:Float) {
        self.c = c
        self.b = b
        
        self.a = sqrtf(powf(self.c, 2) - powf(self.b, 2))    }
    
    func calculateShapePaths(bounds: CGRect) {
        var shapePaths:[UIBezierPath] = []
        
        let lineWidth:CGFloat = 5.0
        
        let heightRatio = self.a / Float(bounds.height)
        let widthRatio = self.b / Float(bounds.width)
        
        let sizeRatio = max(heightRatio, widthRatio)
        
        
        let width = CGFloat(self.b / sizeRatio) - lineWidth - 10.0
        let height = CGFloat(self.a / sizeRatio) - lineWidth - 10.0
        let x = (bounds.width - CGFloat(width)) / 2.0
        let y = (bounds.height - CGFloat(height)) / 2.0
        
        let shapePath = UIBezierPath(CGRect(x: x, y: y, width: width, height: height))
        shapePath.lineWidth = lineWidth
        shapePaths.append(shapePath)
        
        self.shapePaths = shapePaths
        self.bounds = bounds
    }
    
    func calculateShapePaths() {
        self.calculateShapePaths(bounds: self.bounds)
    }
    
    
}
