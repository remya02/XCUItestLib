import Foundation
import XCTest

class XCUItestLib {
    // MARK: - Reference applications under test
    public lazy var app = XCUIApplication()
//    // MARK: - Page Elements
//    lazy var backButton = app.navigationBars.buttons.element(boundBy: 0)
//    lazy var keyboard = app.keyboards.element(boundBy: 0)
//    lazy var doneButton = app.buttons[uIToolBarDoneButton]
//    lazy var navBarCancelButton = app.navigationBars.buttons[navBarCancelButtonTitle]
//    lazy var navBarCloseButton = app.navigationBars.buttons[navBarCloseButtonTitle]
//    lazy var navBarDeleteButton = app.navigationBars.buttons[navBarDeleteButtonTitle]
//    lazy var navBarDoneButton = app.navigationBars.buttons[navBarDoneButtonTitle]
//    lazy var navBarEditButton = app.navigationBars.buttons[navBarEditButtonTitle]
//    lazy var navBarSkipButton = app.navigationBars.buttons[navBarSkipButtonTitle]
//
//    // MARK: - Methods
//
//    let dashBoardScreenElements = DashboardScreenElements()
//    let loginElements = LoginElements()
//
//
    /*Tap methods for buttons */
    func tapElement(element: XCUIElement, elementName: String = "Element") {
        //Log.info("'\(elementName)'tap")
        element.tap()
    }
//
//
//    func tapBackButton() {
//        Log.info("Back button tap")
//        tapElement(element: backButton, elementName: "Back Button")
//    }
//
//
//    func tapCoordinate(xCoordinate: Double, yCoordinate: Double) {
//        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
//        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
//        coordinate.tap()
//    }
//
//    func tapNavBarCancelButton() {
//        Log.info("NavBar cancel button tap")
//        tapElement(element: navBarCancelButton, elementName: "Navigation Bar Cancel Button")
//    }
//
//    func tapNavBarEditButton() {
//        Log.info("NavBar Edit button tap")
//        tapElement(element: navBarEditButton, elementName: "\(navBarEditButton) Not Found")
//    }
//
//    func tapNavBarDeleteButton() {
//        Log.info("NavBar Delete button tap")
//        tapElement(element: navBarDeleteButton, elementName: "\(navBarDeleteButton) Not Found")
//    }
//
//    func tapNavBarDoneButton() {
//        Log.info("NavBar Done button tap")
//        tapElement(element: navBarDoneButton, elementName: "\(navBarDoneButton) Not Found")
//    }
//
//    func tapNavBarSkipButton() {
//        Log.info("NavBar Skip button tap")
//        tapElement(element: navBarSkipButton, elementName: "\(navBarSkipButton) Not Found")
//    }
//
//    func verifyNavBarEditButton() {
//        waitForElement(navBarEditButton)
//        //Log.pass("NavBar Edit button is visible")
//    }
//
//    func verifyNavBarDoneButton() {
//        waitForElement(navBarDoneButton)
//       // Log.pass("NavBar Done button is visible")
//    }
    
    /*Keyboard related methods */
    
    func clearTextField(textField: XCUIElement) {
       // Log.info("Clear the text field value")
        if textField.exists {
            let characterCountOfTextField = String(describing: textField.value).count
            if characterCountOfTextField > 0 {
                let deleteStringCharacter = String(repeating: XCUIKeyboardKey.delete.rawValue, count: characterCountOfTextField)
                textField.tap()
                app.typeText(deleteStringCharacter)
            }
        }
    }
    
    func typeIntoTextField(element: XCUIElement , textFieldValue: String, elementName: String) {
       // Log.info("Type the value : '\(textFieldValue)'into text field value")
        tapElement(element: element, elementName: elementName)
        clearTextField(textField: element)
        element.typeText(textFieldValue)
    }
    
//    func verifyKeyboard(isVisible: Bool) {
//        waitForElement(keyboard, isVisible, 5.0, "keyboard")
//        //Log.pass("Keyboard is visible")
//    }
    
    /* Verifying the value is empty*/
    func verifyEmptyValue(_ element: XCUIElement) {
        if element.exists {
            let value = String(describing: element.value!)
            XCTAssertTrue(value.isEmpty, "The value of element is not empty")
           // Log.pass("The value of element is empty")
        }
    }
    
    /*PickerWheel Selection */
    func selectPickerWheelElement(element: XCUIElement, pickerWheelElement: XCUIElement, pickerWheelValue: String) {
        tapElement(element: element, elementName: "'\(element)'")
        pickerWheelElement.adjust(toPickerWheelValue: pickerWheelValue)
       // Log.pass("Picker wheel value is selected and the value is '\(pickerWheelValue)'")
    }
    
    
    // MARK: - Wait Methods
    func waitForElement(_ element: XCUIElement, _ toExist: Bool = true, _ timeOut: Double = 5.0, _ elementName: String = "element", file: StaticString = #file, line: UInt = #line) {
        let predicate = NSPredicate(format: "exists == \(toExist)")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeOut)
        XCTAssertTrue(result == .completed, "Wait for element \(elementName) with existence as \(toExist) timed out after \(timeOut) seconds.", file: file, line: line)
        //Log.pass("The element: '\(element)' exists in the view")
    }
    
    //Scroll Methods
    
    func scrollDown() {
        //Log.info("Page scrolled dowm")
        app.swipeDown()
    }
    
    func scrollUp() {
        //Log.info("Page scrolled up")
        app.swipeUp()
    }
    
    //Swipe methods
    func swipeLeft(element: XCUIElement) {
       // Log.info("Swipe the page to left")
        var swipeCount = 0
        while(swipeCount < 10) {
            if(element.waitForExistence(timeout: 2.0)){break}
            app.gentleSwipe(.left)
            swipeCount = swipeCount + 1
        }
        waitForElement(element)
    }
    
    func swipeUp(element: XCUIElement) {
       // Log.info("Swipe up the page")
        var swipeCount = 0
        while(swipeCount < 10 && !element.isHittable) {
            app.gentleSwipe(.up)
            swipeCount = swipeCount + 1
            sleep(5)
        }
        waitForElement(element)
        sleep(1)
    }
    
    func swipeDown(element: XCUIElement) {
       // Log.info("Swipe down the page")
        var swipeCount = 0
        while(swipeCount < 3 && !element.isHittable) {
            app.swipeDown()
            swipeCount = swipeCount + 1
            sleep(2)
        }
        waitForElement(element)
        sleep(1)
    }
    
    func gentleSwipeDown(element: XCUIElement) {
        var swipeCount = 0
        while(swipeCount < 10 && !element.isHittable) {
            app.gentleSwipe(.down)
            swipeCount = swipeCount + 1
            sleep(2)
        }
        waitForElement(element)
        sleep(1)
    }
    
    func gentleSwipeUp(_ element: XCUIElement) {
        var swipeCount = 0
        while(swipeCount < 10 && !element.isHittable) {
            app.gentleSwipe(.up)
            swipeCount = swipeCount + 1
            sleep(4)
        }
        waitForElement(element)
        sleep(1)
    }
    
    
    func verifyTheTextIsVisible(_ text: String) {
        let predicate = NSPredicate(format: "label LIKE '\(text)'")
        let result = app.staticTexts.element(matching: predicate)
        XCTAssert(result.exists)
        //Log.pass("The text is visible and the text value is '\(text)'")
    }
    
    func isOnScreen(element: XCUIElement) -> Bool {
        // An element might exist but be hiding off-screen
        let windowFrame = app.windows.element(boundBy: 0).frame
        let elementFrame = element.frame
        return windowFrame.intersects(elementFrame)
        //Log.pass("Element is on the screen")
    }
}

extension XCUIElement {
    
    enum Direction: Int {
        case up, down, left, right
    }
    
    func gentleSwipe(_ direction: Direction) {
        let half: CGFloat = 0.5
        let lessThanHalf: CGFloat = 0.25
        let moreThanHalf: CGFloat = 0.75
        let pressDuration: TimeInterval = 0.05
        
        let center = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCenter = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCenter = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCenter = self.coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCenter = self.coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))
        
        switch direction {
        case .up:
            center.press(forDuration: pressDuration, thenDragTo: aboveCenter)
        case .down:
            center.press(forDuration: pressDuration, thenDragTo: belowCenter)
        case .left:
            center.press(forDuration: pressDuration, thenDragTo: leftOfCenter)
        case .right:
            center.press(forDuration: pressDuration, thenDragTo: rightOfCenter)
        }
    }
}



