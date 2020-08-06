//
//  ViewController.swift
//  Tipper
//
//  Created by Vivian Dang on 8/3/20.
//  Copyright © 2020 Vivian. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    


    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitBillTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //make keyboard first responder
        self.billAmountTextField.becomeFirstResponder()
        
        //rounded corners
        tipPercentageLabel.layer.cornerRadius = 5
        tipPercentageLabel.layer.masksToBounds = true
        
        totalLabel.layer.cornerRadius = 5
        totalLabel.layer.masksToBounds = true
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //get bill amt
        let bill = Double(billAmountTextField.text!) ?? 0 //checks for number input
        
        //calc tip & total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let split = Double(splitBillTextField.text!) ?? 0 //# of people to split bill with
        let total = (bill + tip)/split
        
        
        //update tip & total labels
        
        tipPercentageLabel.text = String(format: "$%.2f", tip) //.2%f is the value input for decimal #
        totalLabel.text = String(format: "$%.2f", total)
    }
}

