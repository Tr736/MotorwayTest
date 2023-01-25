import XCTest
extension XCUIElement {
    private static let defaultTimeout: TimeInterval = 10

    func wait(timeout: TimeInterval = defaultTimeout) -> Bool {
        waitForExistence(timeout: timeout)
    }

    func clearText() {
        doubleTap()
        guard let stringValue = self.value as? String else {
            return
        }
        // workaround for apple bug
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }

        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        typeText(deleteString)
    }

    func clearAndTypeText(_ text: String) {
        clearText()
        typeText(text)
    }
}
