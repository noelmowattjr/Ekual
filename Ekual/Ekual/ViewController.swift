//
//  ViewController.swift
//  Ekual
//
//  Created by Noel Mowatt Jr. on 9/19/16.
//  Copyright © 2016 NoelMowattJr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //--Display Label
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //---------------BUTTON ACTIONS---------------//
    
    //--Numbers
    @IBAction func NumberClicked(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            print("0 button pressed")
        case 1:
            print("1 button pressed")
        case 2:
            print("2 button pressed")
        case 3:
            print("3 button pressed")
        case 4:
            print("4 button pressed")
        case 5:
            print("5 button pressed")
        case 6:
            print("6 button pressed")
        case 7:
            print("7 button pressed")
        case 8:
            print("8 button pressed")
        case 9:
            print("9 butt pressed")
        default:
            return
        }
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

