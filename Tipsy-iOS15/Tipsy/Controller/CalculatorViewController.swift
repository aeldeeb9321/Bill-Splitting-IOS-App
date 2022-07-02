//
//  ViewController.swift
//  Tipsy
//
//  Created by Ali Eldeeb on 6/30/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var split = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    //.dropLast() returns everything except the last number or character of a string
    @IBAction func tipChanged(_ sender: UIButton){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonWithoutPercent = Double(buttonTitle.dropLast()) ?? 0
        tip = buttonWithoutPercent/100
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        split = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != ""{
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(split)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let resultVc = segue.destination as! ResultsViewController
            
            resultVc.tip = Int(tip*100)
            resultVc.split = split
            resultVc.result = finalResult
            
        }
    }

}

