import XCTest

extension XCUIElement {
    

    func existsAndVisible() -> Bool {
        return exists && isHittable
    }

    func size() -> CGSize {
        return frame.size
    }

    func isVisible() -> Bool {
        return isHittable
    }

    enum Movements {
        case up
        case down
    }
    func swipe(direction: Movements, timeout: TimeInterval = 5, until blockIsTrue: () -> Bool) {

        let endTime = Date() + timeout

        while !blockIsTrue() {
            guard endTime > Date() else {
                XCTFail("Timed out while swiping \(direction)")
                return
            }
            switch direction {
            case .down:
                swipeDown()
            case .up:
                swipeUp()
            }
        }
    }
    
    func tapElement(element: XCUIElement, elementName: String = "Element") {
        element.tap()
    }
    

}

extension XCTestCase {
    func waitForElement(_ element: XCUIElement, visibility visible: Bool = true, timeout time: Double = 5) {
        let predicate = visible == true ? NSPredicate(format: "isHittable = true") : NSPredicate(format: "isHittable = false")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter.wait(for: [expectation], timeout: time)
        guard result == .completed else {
            XCTFail("Could not find \(element)")
            return
        }
    }
}
