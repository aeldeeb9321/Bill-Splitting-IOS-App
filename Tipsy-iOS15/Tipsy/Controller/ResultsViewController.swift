//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ali Eldeeb on 6/30/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0"
    var tip = 10
    var split = 2
    
    //var totalCost = "0" 
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.text = "Split bill between \(split) people with \(tip)% tip "

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
   

}
