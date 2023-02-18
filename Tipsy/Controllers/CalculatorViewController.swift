//
//  ViewController.swift
//  Tipsy
//
//  Created by Василий Васильевич on 18.02.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        if sender == zeroPctButton {
            print("Zero percent button pressed: 0.0")
        } else if sender == tenPctButton {
            print("Ten percent button pressed: 0.1")
        } else if sender == twentyPctButton {
            print("Twenty percent button pressed: 0.2")
        }
        sender.isSelected = true
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let splitNumber = Int(splitNumberLabel.text ?? "1") ?? 1
        guard let billAmount = Double(billTextField.text ?? "") else {
            print("Invalid bill amount")
            return
        }
        
        print("Bill Amount: \(billAmount)")
        print("Split Number: \(splitNumber)")
        
        let tipPercentage: Double
        
        if tenPctButton.isSelected {
            tipPercentage = 0.1
        } else if twentyPctButton.isSelected {
            tipPercentage = 0.2
        } else {
            tipPercentage = 0.0
        }
        
        let totalAmount = billAmount * (1 + tipPercentage)
        let amountPerPerson = totalAmount / Double(splitNumber)
        let formattedAmount = String(format: "%.2f", amountPerPerson)
        
        print("Total Amount: \(totalAmount)")
        print("Amount per person: \(formattedAmount)")
    }
}
