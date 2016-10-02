//
//  ViewController.swift
//  Ekual
//
//  Created by Noel Mowatt Jr. on 9/19/16.
//  Copyright © 2016 NoelMowattJr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //--var heartBeatSoundEffect = AVAudioPlayer()

    //-------------Current Operations & States------------------//
    var currOperation: Operator = Operator.nothing //--Stores current operator
    var calcState: CalculationState = CalculationState.enteringNum //--Var for tracking Calculation state
    
    //--Will hold the very first value that we will be calculated against the sec value on screen
    var firstValue: String = ""
    
    //--Display Label for results
    @IBOutlet weak var displayLabel: UILabel!
    
    //---BUTTON Outlets---//
    @IBOutlet weak var clearBUTT: UIButton!
    @IBOutlet weak var equalBUTT: UIButton!
    
    @IBOutlet weak var plusBUTT: UIButton!
    @IBOutlet weak var minusBUTT: UIButton!
    @IBOutlet weak var timesBUTT: UIButton!
    @IBOutlet weak var divideBUTT: UIButton!
    
    @IBOutlet weak var oneBUT: UIButton!
    @IBOutlet weak var twoBUTT: UIButton!
    @IBOutlet weak var threeBUTT: UIButton!
    @IBOutlet weak var fourBUTT: UIButton!
    @IBOutlet weak var fiveBUTT: UIButton!
    @IBOutlet weak var sixBUTT: UIButton!
    @IBOutlet weak var sevenBUTT: UIButton!
    @IBOutlet weak var eightBUTT: UIButton!
    @IBOutlet weak var nineBUTT: UIButton!
    @IBOutlet weak var zeroBUTT: UIButton!
    
    
    
    //----Initial Setup-----//
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //---------------BUTTON ACTIONS---------------//
    //--Numbers
    @IBAction func NumberClicked(_ sender: UIButton) {
        
        updateDisplay(number: String(sender.tag))   //--call updateDisplay func and pass it my tag args
        
        //--Animating my number buttons
        if sender.tag == 1 {
            AnimateThis(b: oneBUT)
        } else if sender.tag == 2 {
            AnimateThis(b: twoBUTT)
        } else if sender.tag == 3 {
            AnimateThis(b: threeBUTT)
        } else if sender.tag == 4 {
            AnimateThis(b: fourBUTT)
        } else if sender.tag == 5 {
            AnimateThis(b: fiveBUTT)
        } else if sender.tag == 6 {
            AnimateThis(b: sixBUTT)
        } else if sender.tag == 7 {
            AnimateThis(b: sevenBUTT)
        } else if sender.tag == 8 {
            AnimateThis(b: eightBUTT)
        } else if sender.tag == 9 {
            AnimateThis(b: nineBUTT)
        } else if sender.tag == 0 {
            AnimateThis(b: zeroBUTT)
        }
    }
    
    //--UPDATE display when a number is clicked--//
    func updateDisplay(number: String){
        //displayLabel.text = ""//---THIS
        if calcState == CalculationState.newNumStarted { //--If we start a new number
            if let num = displayLabel.text {    //--If we can get something out of displayLabel
                if num != "" {  //--if user enters something, we have something to store in firstValue
                    firstValue = num
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
            AnimateThis(b: plusBUTT)
        case 11:
            currOperation = Operator.subtract
            AnimateThis(b: minusBUTT)
        case 12:
            currOperation = Operator.times
            AnimateThis(b: timesBUTT)
        case 13:
            currOperation = Operator.division
            AnimateThis(b: divideBUTT)
        default:
            return
        }
    }
    
    //--Equals
    @IBAction func EqualsClicked(_ sender: UIButton) {
       calculationBrain()  //--Call the brain
        
        //--Animate
        AnimateThis(b: equalBUTT)
    }
    
    //--The brains of the EQUAL button--//
    func calculationBrain () {
        if firstValue.isEmpty {     //--user enters nada then
            return                  //--nothing happens
        }
        
        var results = ""    //--results holder
        
        //--Let's calculate--//
        if currOperation == Operator.add {
            if let num = displayLabel.text{if num == "" {return}}
            results = "\(Double(firstValue)! + Double(displayLabel.text!)!)"
        } else if currOperation == Operator.subtract {
            if let num = displayLabel.text{if num == "" {return}}
            results = "\(Double(firstValue)! - Double(displayLabel.text!)!)"
        } else if currOperation == Operator.times {
            if let num = displayLabel.text{if num == "" {return}}
            results = "\(Double(firstValue)! * Double(displayLabel.text!)!)"
        } else if currOperation == Operator.division {
            if let num = displayLabel.text{if num == "" {return}}
            results = "\(Double(firstValue)! / Double(displayLabel.text!)!)"
        }
        
        displayLabel.text = results //--Assign results of calculation to displayLabel
        calcState = CalculationState.newNumStarted  //--change calc state to new num started
    }
    
    //--Clear
    @IBAction func ClearClicked(_ sender: UIButton) {
        displayLabel.text = ""  //--CLEARS Label
        
        //--Animate
        AnimateThis(b: clearBUTT)
    }
    
    //------ANIMATION FUNCTION-----------//
    func AnimateThis(b: UIButton){
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //--Equal button increase
            b.bounds.size.width += 12
            b.bounds.size.height += 12
            
            }, completion: { finished in
                
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                    
                    //--Equal button decrease
                    b.bounds.size.width -= 12
                    b.bounds.size.height -= 12
                    
                }, completion: nil)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

