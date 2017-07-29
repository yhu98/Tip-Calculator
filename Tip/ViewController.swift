//
//  ViewController.swift
//  Tip
//
//  Created by YupinHuPro on 7/29/17.
//  Copyright © 2017 Yupin Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tipPercentages = [0.18, 0.2, 0.25]

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!


    override func viewDidLoad() {
        // get value from user default
        let defaults = UserDefaults.standard
        let value = defaults.double(forKey: "defaultTipPercentage")
        // get index based on user default
        let index = tipPercentages.index(of: value) ?? 0
        // set index on segment control
        tipControl.selectedSegmentIndex = index
        // trigger tipControlValueChanged function
        calculateTip(self)
    }


    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {

        guard let billFieldText = billField.text else { return }
        let bill = Double(billFieldText) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
}

