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
        //displayLabel.text = "0" //--THIS
    }
    
    //---------------BUTTON ACTIONS---------------//
    //--Numbers
    @IBAction func NumberClicked(_ sender: UIButton) {
        
        updateDisplay(number: String(sender.tag))   //--call updateDisplay func and pass it my tag args
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
            
            //-----Animate Clear Button------------//
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                //--Equal button increase
                self.plusBUTT.bounds.size.width += 5
                
                }, completion: { finished in
                    
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                        
                        //--Equal button decrease
                        self.plusBUTT.bounds.size.width -= 5
                        
                        }, completion: nil)
            })

        case 11:
            currOperation = Operator.subtract
            
            //-----Animate Clear Button------------//
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                //--Equal button increase
                self.minusBUTT.bounds.size.width += 5
                
                }, completion: { finished in
                    
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                        
                        //--Equal button decrease
                        self.minusBUTT.bounds.size.width -= 5
                        
                        }, completion: nil)
            })
            
        case 12:
            currOperation = Operator.times
            
            //-----Animate Clear Button------------//
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                //--Equal button increase
                self.timesBUTT.bounds.size.width += 5
                
                }, completion: { finished in
                    
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                        
                        //--Equal button decrease
                        self.timesBUTT.bounds.size.width -= 5
                        
                        }, completion: nil)
            })
            
        case 13:
            currOperation = Operator.division
            
            //-----Animate Clear Button------------//
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                //--Equal button increase
                self.divideBUTT.bounds.size.width += 5
                
                }, completion: { finished in
                    
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                        
                        //--Equal button decrease
                        self.divideBUTT.bounds.size.width -= 5
                        
                        }, completion: nil)
            })
            
        default:
            return
        }
    }
    
    //--Equals
    @IBAction func EqualsClicked(_ sender: UIButton) {
       calculationBrain()  //--Call the brain
        
        AnimateThis()
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
        displayLabel.text = ""  //--CLEARS Label
        
        //-----Animate Clear Button------------//
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //--Equal button increase
            self.clearBUTT.bounds.size.width += 5
            
            }, completion: { finished in
                
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                    
                    //--Equal button decrease
                    self.clearBUTT.bounds.size.width -= 5
                    
                    }, completion: nil)
        })
    }
    
    //------Animation Functon-----------//
    func AnimateThis(){
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //--Equal button increase
            self.equalBUTT.bounds.size.width += 5
            
            }, completion: { finished in
                
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                    
                    //--Equal button decrease
                    self.equalBUTT.bounds.size.width -= 5
                    
                }, completion: nil)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

