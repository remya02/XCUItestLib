//
//  MTPLogger.swift
//  LoginUITests
//
//  Created by Remya Surendran Anjamkudi on 15/01/20.
//  Copyright © 2020 NowTV. All rights reserved.
//

import Foundation
class MTPLogger {
    
    static func formatMessage(message: String, type: String, expected: String = "") -> String{
        switch  type{
        case "step":
            return "STEP '\(message)'"
        case "pass":
            return "ASSERTION PASSED \n Expected Result:'\(expected)' \n Actual Result: '\(message)'"
        case "fail":
             return "ASSERTION FAILED \n Expected Result:'\(expected)' \n Actual Result: '\(message)'"
        default:
            return "'\(message)'"
        }
    }
    
    
    static func step(message: String){
        self.formatMessage(message: message, type: "step")
    }
}
