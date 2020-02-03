//
//  BaseTest.swift
//  XCUItestLib
//
//  Created by Remya Surendran Anjamkudi on 03/02/20.
//  Copyright © 2020 Remya Surendran Anjamkudi. All rights reserved.
//

import Foundation


import XCTest

open class BaseTest: XCTestCase {
    
    // MARK: Properties
    /// Stores `XCUIApplication` for the duration of the test.
    open var app: XCUIApplication!
    
    // MARK: Methods
    /// Setup method called before the invocation of each test method in the class.
    override open func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
    }
    
    /// Teardown method called after the invocation of each test method in the class.
    override open func tearDown() {
        app = nil
        super.tearDown()
    }
}

