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
    @IBOutlet var cField:UITextField!
    
    @IBOutlet var canvas:DrawView!
    
    var triangle:Triangle!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        canvas.triangle = self.triangle
        canvas.setNeedsDisplay()
    }
}
