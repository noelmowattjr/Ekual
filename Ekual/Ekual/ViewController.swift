//
//  ViewController.swift
//  Ekual
//
//  Created by Noel Mowatt Jr. on 9/19/16.
//  Copyright © 2016 NoelMowattJr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //-------------Current Operations & States------------------//
    var currOperation: Operator = Operator.nothing //--Stores current operator
    var calcState: CalculationState = CalculationState.enteringNum //--Var for tracking Calculation state
    
    //--Will hold the very first value that we will be calculated against the sec value on screen
    var firstValue: String = ""
    
    //--Display Label for results
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //---------------BUTTON ACTIONS---------------//
    
    //--Numbers
    @IBAction func NumberClicked(_ sender: UIButton) {
        
        
    }
    
    //--Operators
    @IBAction func OperatorClicked(_ sender: UIButton){
        switch sender.tag {
        case 10:
            print("+ button pressed")
        case 11:
            print("- button pressed")
        case 12:
            print("x button pressed")
        case 13:
            print("/ button pressed")
        default:
            return
        }
    }
    
    //--Equals
    @IBAction func EqualsClicked(_ sender: UIButton) {
        switch sender.tag {
        case 14:
            print("= button pressed")
        default:
            return
        }
    }
    
    //--Clear
    @IBAction func ClearClicked(_ sender: UIButton) {
        switch sender.tag {
        case 15:
            print("clear button pressed")
        default:
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

