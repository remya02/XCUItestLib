
import UIKit

open class ReadData {
    
    func getDataFromDataMap(testId: String) -> Array<String> {
        // let datamap = DataMap()
        var testData = [String]()
        
        var dataMap = [String: Array<String>]()
        
        let bundle = Bundle(for: type(of: self))
        print("My bundle...",bundle)
        guard let filePath = bundle.path(forResource: "datamap", ofType: "txt")
            else { fatalError() }
        let pathURL = URL(fileURLWithPath: filePath)
        if FileManager.default.fileExists(atPath: pathURL.path) { print(1) }
        
        let s = StreamReader(url: pathURL)
        while let line = s?.nextLine(){
            print("valueee....", line)
            let stringOfArray = line.components(separatedBy: "|")
            print("array...", stringOfArray)
            if(stringOfArray.contains(testId)){
                let rowVaue = stringOfArray[1]
                let inputFileValue = stringOfArray[2]
                testData = getDataFromInputText(row: rowVaue, inputFile: inputFileValue)
                //dataMap["123"]=testData
                break
            }
            
        }
        
        return testData
        
    }
    
    open func getDataFromDataMapAlt(testId: String) -> Dictionary<Int, Dictionary<String, String>>{
        // let datamap = DataMap()
        //var testData = [String]()
        
        var dataMap = [Int: Dictionary<String, String>]()
        
        let bundle = Bundle(for: type(of: self))
        print("My bundle...",bundle)
        guard let filePath = bundle.path(forResource: "datamap", ofType: "txt")
            else { fatalError() }
        let pathURL = URL(fileURLWithPath: filePath)
        if FileManager.default.fileExists(atPath: pathURL.path) { print(1) }
        
        let s = StreamReader(url: pathURL)
        var dataCounter = 0
        while let line = s?.nextLine(){
            print("valueee....", line)
            let stringOfArray = line.components(separatedBy: "|")
            print("array...", stringOfArray)
            if(stringOfArray.contains(testId)){
                let rowVaue = stringOfArray[1]
                let inputFileValue = stringOfArray[2]
                let testData = getDataFromInputTextAlt(row: rowVaue, inputFile: inputFileValue)
                dataMap[dataCounter]=testData
                dataCounter+=1
            }
            
        }
        
        return dataMap
        
    }
    
    
    open func getDataFromInputTextAlt(row : String, inputFile: String) -> Dictionary<String, String>{
        var dataRow=Dictionary<String, String>()
        
        var headerArray=[String]()
        
        let bundle = Bundle(for: type(of: self))
        print("My bundle...",bundle)
        guard let filePath = bundle.path(forResource: "input_df1", ofType: "txt")
            else { fatalError() }
        let pathNav = URL(fileURLWithPath: filePath)
        if let aStreamReader = StreamReader(url:pathNav) {
            var dataStr = ""
            
            while let line = aStreamReader.nextLine() {
                
                if(headerArray.count==0)
                {
                    headerArray=line.components(separatedBy: "|")
                }
                
                
                if line.contains(row) {
                    print("line...",line)
                    print("I found: \(row)")
                    dataStr = line + "\n"
                    break
                }
            }
            print("InputData", dataStr)
            var dataArray = dataStr.components(separatedBy: "|")
            print("DataArray....",dataArray)
            /*let key = dataArray[0]
             //dataArray.remove(at: 0)
             print("test data..", dataArray)
             print("key..", key)*/
            
            for key in 0..<dataArray.count{
                dataRow[headerArray[key]]=dataArray[key]
            }
            
        } else {
            print("cannot open file")
        }
        return dataRow
    }
    
    open func getDataFromInputText(row : String, inputFile: String) -> Array<String>{
        var dataArray=[String]()
        
        let bundle = Bundle(for: type(of: self))
        print("My bundle...",bundle)
        guard let filePath = bundle.path(forResource: "input_df1", ofType: "txt")
            else { fatalError() }
        let pathNav = URL(fileURLWithPath: filePath)
        if let aStreamReader = StreamReader(url:pathNav) {
            var dataStr = ""
            while let line = aStreamReader.nextLine() {
                
                if line.contains(row) {
                    print("line...",line)
                    print("I found: \(row)")
                    dataStr = line + "\n"
                    break
                }
            }
            print("InputData", dataStr)
            dataArray = dataStr.components(separatedBy: "|")
            print("DataArray....",dataArray)
            let key = dataArray[0]
            dataArray.remove(at: 0)
            print("test data..", dataArray)
            print("key..", key)
            
        } else {
            print("cannot open file")
        }
        return dataArray
    }
    
    
    
}
