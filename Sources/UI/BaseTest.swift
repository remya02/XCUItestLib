

import XCTest

public class BaseTest: XCTestCase {

//    var statementScreen: StatementScreen!
//    var loginScreen: LoginScreen!
//    var dashboardScreen: DashboardScreen!
    var testApp = XCUIApplication()
    
    //let loginElements = LoginElements()
    
    override func setUp() {
        testApp.launch()
        XCUIDevice.shared.orientation = .portrait
        continueAfterFailure = false
    }
    
//    func addTestsWithData(dict: Dictionary<String ,String>, toTestSuite testSuite: XCTestSuite, currentClass: AnyClass){
//
//        let className = String(NSStringFromClass(currentClass).split(separator: ".").last!)
//        let testSuite = XCTestSuite(name:className)
//        let invocations = currentClass.testInvocations
//
//        for invocation in invocations! {
//            let testcaseId = invocation.selector.description
//            let data = ReadData().getDataFromDataMapAlt(testId: testcaseId)
//            for (key,dataRow) in data.enumerated(){
//                let testCase = LoginScreenTests(invocation: invocation)
//                //let testCase = self(invocation: invocation)
//                testCase.dataDict = dataRow.value
//                testSuite.addTest(testCase)
//            }
//        }
//    }
    
    override func tearDown() {
        testApp.terminate()
    }
    
}
