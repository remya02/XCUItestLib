import Foundation
import XCTest

public class BasePage {
    // MARK: - Reference applications under test
    public lazy var app = BaseTest().testApp
    // MARK: - Page Elements
    lazy var backButton = app.navigationBars.buttons.element(boundBy: 0)
    lazy var keyboard = app.keyboards.element(boundBy: 0)
    lazy var doneButton = app.buttons[uIToolBarDoneButton]
    lazy var navBarCancelButton = app.navigationBars.buttons[navBarCancelButtonTitle]
    lazy var navBarCloseButton = app.navigationBars.buttons[navBarCloseButtonTitle]
    lazy var navBarDeleteButton = app.navigationBars.buttons[navBarDeleteButtonTitle]
    lazy var navBarDoneButton = app.navigationBars.buttons[navBarDoneButtonTitle]
    lazy var navBarEditButton = app.navigationBars.buttons[navBarEditButtonTitle]
    lazy var navBarSkipButton = app.navigationBars.buttons[navBarSkipButtonTitle]
    
    // MARK: - Methods
    
     let dashBoardScreenElements = DashboardScreenElements()
     let loginElements = LoginElements()
    

 /*Tap methods for buttons */
    func tapElement(element: XCUIElement, elementName: String = "Element") {
        element.tap()
    }
    
    
    func tapBackButton() {
        tapElement(element: backButton, elementName: "Back Button")
    }
    
   
    func tapCoordinate(xCoordinate: Double, yCoordinate: Double) {
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }
    
    func tapNavBarCancelButton() {
        tapElement(element: navBarCancelButton, elementName: "Navigation Bar Cancel Button")
    }
    
    func tapNavBarEditButton() {
        tapElement(element: navBarEditButton, elementName: "\(navBarEditButton) Not Found")
    }
    
    func tapNavBarDeleteButton() {
        tapElement(element: navBarDeleteButton, elementName: "\(navBarDeleteButton) Not Found")
    }
    
    func tapNavBarDoneButton() {
        tapElement(element: navBarDoneButton, elementName: "\(navBarDoneButton) Not Found")
    }
    
    func tapNavBarSkipButton() {
        tapElement(element: navBarSkipButton, elementName: "\(navBarSkipButton) Not Found")
    }

    func verifyNavBarEditButton() {
        waitForElement(navBarEditButton)
    }
    
    func verifyNavBarDoneButton() {
        waitForElement(navBarDoneButton)
    }
    
    /*Keyboard related methods */
    
    func clearTextField(textField: XCUIElement) {
        if textField.exists {
            let characterCountOfTextField = String(describing: textField.value).count
            if characterCountOfTextField > 0 {
                let deleteStringCharacter = String(repeating: XCUIKeyboardKey.delete.rawValue, count: characterCountOfTextField)
                textField.tap()
                app.typeText(deleteStringCharacter)
            }
        }
    }
    
    func typeIntoTextField(element: XCUIElement , textFieldValue: String) {
        tapElement(element: element)
        clearTextField(textField: element)
        element.typeText(textFieldValue)
    }
    
    func verifyKeyboard(isVisible: Bool) {
        waitForElement(keyboard, isVisible, nFiveSeconds, "keyboard")
    }
    
    /* Verifying the value is empty*/
    func verifyEmptyValue(_ element: XCUIElement) {
        if element.exists {
            let value = String(describing: element.value!)
            XCTAssertTrue(value.isEmpty, "The value of element is not empty")
        }
    }
    
    /*PickerWheel Selection */
    func selectPickerWheelElement(element: XCUIElement, pickerWheelElement: XCUIElement, pickerWheelValue: String) {
        tapElement(element: element)
        pickerWheelElement.adjust(toPickerWheelValue: pickerWheelValue)
    }
    
    
    // MARK: - Wait Methods
    func waitForElement(_ element: XCUIElement, _ toExist: Bool = true, _ timeOut: Double = nFiveSeconds, _ elementName: String = "element", file: StaticString = #file, line: UInt = #line) {
        let predicate = NSPredicate(format: "exists == \(toExist)")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeOut)
        XCTAssertTrue(result == .completed, "Wait for element \(elementName) with existence as \(toExist) timed out after \(timeOut) seconds.", file: file, line: line)
        Log.step("Wait for message") 
    }
    
    //Scroll Methods
    
    func scrollDown() {
        app.swipeDown()
    }
    
    func scrollUp() {
        app.swipeUp()
    }
    
    //Swipe methods
    func swipeLeft(element: XCUIElement) {
        var swipeCount = 0
        while(swipeCount < 10) {
            if(element.waitForExistence(timeout: nTwoSeconds)){break}
            app.gentleSwipe(.left)
            swipeCount = swipeCount + 1
        }
        waitForElement(element)
    }
    
    func swipeUp(element: XCUIElement) {
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
    }
    
    func isOnScreen(element: XCUIElement) -> Bool {
        // An element might exist but be hiding off-screen
        let windowFrame = app.windows.element(boundBy: 0).frame
        let elementFrame = element.frame
        return windowFrame.intersects(elementFrame)
    }
    
    
    func validateElement(actual: String, expected: String)  {
       // XCTAssertEqual(actual, expected,)
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



