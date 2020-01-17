//
//  Logger.swift
//  LoginUITests
//
//  Created by Remya Surendran Anjamkudi on 15/01/20.
//  Copyright © 2020 NowTV. All rights reserved.
//

import Foundation

enum LogEvent: String {
    
    case step = "[STEP]" 
    case pass = "[PASS]"
    case fail = "[FAIL]"
}

func writeToFile(message: String){
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



class Log {
    
    static var dateFormat = "yyyy-MM-dd hh:mm:ss"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    
    class func step( _ object: Any, filename: String = #file) {
        let message = "\(Date().toString()) \(LogEvent.step.rawValue)[\(sourceFileName(filePath: filename))] -> \(object)\n"
        writeToFile(message: message)
    }
    
    class func pass ( _ object: Any, filename: String = #file) {
        let message = "\(Date().toString()) \(LogEvent.pass.rawValue)[\(sourceFileName(filePath: filename))] -> \(object)\n"
        writeToFile(message: message)
    }
    
   
    class func fail( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        let message = "\(Date().toString()) \(LogEvent.fail.rawValue)[\(sourceFileName(filePath: filename))] -> \(object)\n"
        writeToFile(message: message)
    }
    
   
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
}
internal extension Date {
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
}
