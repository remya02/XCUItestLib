//
//  Logger.swift
//  XCUItestLib
//
//  Created by Remya Surendran Anjamkudi on 29/01/20.
//  Copyright © 2020 Remya Surendran Anjamkudi. All rights reserved.
//


import Foundation

enum LogEvent: String {
    
    case step = "[STEP]"
    case pass = "[PASS]"
    case fail = "[FAIL]"
    case info = "[INFO]"
}


open class Log {
    
    class func step( _ object: Any) {
        let message = "\(LogEvent.step.rawValue) -> \(object)\n"
        writeToFile(message: message)
    }
    
    class func pass ( _ object: Any) {
        let message = "\(LogEvent.pass.rawValue) -> \(object)\n"
        writeToFile(message: message)
    }
    
    class func fail( _ object: Any) {
        let message = "\(LogEvent.fail.rawValue) -> \(object)\n"
        writeToFile(message: message)
    }
    
    class func info( _ object: Any) {
        let message = "\(LogEvent.info.rawValue) -> \(object)\n"
        writeToFile(message: message)
    }
    
    
}

public func writeToFile(message: String){
    let fileName = "Test"
    let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    let path = fileURL.path
    let fileManager = FileManager.default
    if !fileManager.fileExists(atPath: path) {
        do {
            try "".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
        } catch _ {
        }
    }
    if let fileHandle = FileHandle(forWritingAtPath: path) {
        
        fileHandle.seekToEndOfFile()
        fileHandle.write(message.data(using: String.Encoding.utf8)!)
        fileHandle.closeFile()
    }
}



