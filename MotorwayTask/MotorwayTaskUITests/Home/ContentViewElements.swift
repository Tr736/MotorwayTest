import XCTest
enum Content {
    static let titleLabel = XCUIApplication().staticTexts.element(matching: .any,
                                                                   identifier: AccessibilityID.Content.titleLabel).firstMatch

    static let textField = XCUIApplication().otherElements.element(matching: .any,
                                                                identifier: AccessibilityID.Content.textField).firstMatch
}

enum Components {

    enum TextfieldWithWordCount {
        static let wordCountLabel = XCUIApplication().staticTexts.element(matching: .any,
                                                                          identifier: AccessibilityID.Components.TextFieldWithCounter.label).firstMatch
        static let textField = XCUIApplication().textFields.element(matching: .any,
                                                                    identifier: AccessibilityID.Components.Generic.textField).firstMatch
    }

}
