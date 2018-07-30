//
//  DrawView.swift
//  PythagoreanTheorem
//
//  Created by Sam Dindyal on 2018-07-30.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var triangle: Triangle! {
        didSet {
            self.triangle?.calculateShapePaths(bounds: self.bounds)
        }
    }
    
    override func draw(_ rect: CGRect) {
        if let path = triangle?.shapePath {
            UIColor.darkGray.setStroke()
            path.stroke()
        }
    }
}
