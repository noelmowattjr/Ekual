//
//  StructsEnums.swift
//  Ekual
//
//  Created by Noel Mowatt Jr. on 9/24/16.
//  Copyright © 2016 NoelMowattJr. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case division = "/"
    case nothing = ""
}

//--Tracks calculator state
enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
