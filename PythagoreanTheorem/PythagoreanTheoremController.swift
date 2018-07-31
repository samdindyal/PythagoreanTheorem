//
//  PythagoreanTheoremController.swift
//  PythagoreanTheorem
//
//  Created by Sam Dindyal on 2018-07-30.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class PythagoreanTheoremController: UIViewController {
    @IBOutlet var aField:UITextField!
    @IBOutlet var bField:UITextField!
    
    @IBOutlet var cLabel:UILabel!
    
    @IBOutlet var canvas:DrawView!
    
    @IBAction func aFieldChanged(_ sender: UITextField) {
        if let triangle = self.triangle {
            if let a = Float(aField.text!),
                a > 0 {
                triangle.a = a
                cLabel.text = "\(triangle.c)"
            } else {
                triangle.a = 0
                cLabel.text = "c"
            }
            self.triangle = triangle
        }
    }
    
    @IBAction func bFieldChanged(_ sender: UITextField) {
        if let triangle = self.triangle {
            if let b = Float(bField.text!),
                b > 0 {
                triangle.b = b
                cLabel.text = "\(triangle.c)"
            } else {
                triangle.b = 0
                cLabel.text = "c"
            }
            self.triangle = triangle
        }
    }
    
    var triangle:Triangle! {
        didSet {
            if let canvas = self.canvas {
                canvas.triangle = self.triangle
                canvas.setNeedsDisplay()
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        canvas.triangle = self.triangle
        canvas.setNeedsDisplay()
    }
}
