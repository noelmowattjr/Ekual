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
    
    //----Initial Setup-----//
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
    }
    
    //---------------BUTTON ACTIONS---------------//
    //--Numbers
    @IBAction func NumberClicked(_ sender: UIButton) {
        updateDisplay(number: String(sender.tag))   //--call updateDisplay func and pass it my tag args
    }
    
    //--UPDATE display when a number is clicked--//
    func updateDisplay(number: String){
        if calcState == CalculationState.newNumStarted { //--If we start a new number
            if let num = displayLabel.text {    //--If we can get something out of displayLabel
                if num != "" {  //--if user enters something, we have something to store in firstValue
                    firstValue = num
                    print("This is firstValue" + firstValue)
                }
            }
            calcState = CalculationState.enteringNum
            displayLabel.text = number
        }
        else if calcState == CalculationState.enteringNum{
            displayLabel.text = displayLabel.text! + number
        }
    }
    //--------------------------------------//
    
    //--Operators
    @IBAction func OperatorClicked(_ sender: UIButton){
        
        calcState = CalculationState.newNumStarted  //--start new nimber when operator is clicked
        
        if let num = displayLabel.text{
            if num != "" {
                firstValue = num
                displayLabel.text = ""
            }
        }
        
        //----Calculation Operators-----//
        switch sender.tag {
        case 10:
            currOperation = Operator.add
        case 11:
            currOperation = Operator.subtract
        case 12:
            currOperation = Operator.times
        case 13:
            currOperation = Operator.division
        default:
            return
        }
    }
    
    //--Equals
    @IBAction func EqualsClicked(_ sender: UIButton) {
       calculationBrain()  //--Call the brain
    }
    
    //--The brains of the EQUAL button--//
    func calculationBrain () {
        if firstValue.isEmpty {     //--user enters nada then
            return                  //--nothing happens
        }
        
        var results = ""    //--results holder
        
        //--Let's calculate--//
        if currOperation == Operator.add {
            results = "\(Int(firstValue)! + Int(displayLabel.text!)!)"
        } else if currOperation == Operator.subtract {
            results = "\(Int(firstValue)! - Int(displayLabel.text!)!)"
        } else if currOperation == Operator.times {
            results = "\(Int(firstValue)! * Int(displayLabel.text!)!)"
        } else if currOperation == Operator.division {
            results = "\(Int(firstValue)! / Int(displayLabel.text!)!)"
        }
        
        displayLabel.text = results //--Assign results of calculation to displayLabel
        calcState = CalculationState.newNumStarted  //--change calc state to new num started
    }
    
    //--Clear
    @IBAction func ClearClicked(_ sender: UIButton) {
        displayLabel.text = "0"  //--CLEARS Label
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

