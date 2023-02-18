//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Василий Васильевич on 18.02.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    var amountPerPerson: String?
    var totalAmount: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let amountPerPerson = self.amountPerPerson, let totalAmount = self.totalAmount {
            totalLabel.text = amountPerPerson
            settingsLabel.text = "Total amount: \(totalAmount)"
        }
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}




