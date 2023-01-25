//
//  MotorwayTaskUITests.swift
//  MotorwayTaskUITests
//
//  Created by Thomas Richardson on 25/01/2023.
//

import XCTest

final class MotorwayTaskUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = true
    }

    func test_randomWordGenerator() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(Content.titleLabel.wait())
        XCTAssertTrue(Content.textField.wait())
        XCTAssertTrue(Components.TextfieldWithWordCount.textField.wait())

        // Check title label text is correct
        XCTAssertEqual(Content.titleLabel.label, "Random Word Generator")
        // Check default value of 5 is set to the word count label
        XCTAssertEqual(Components.TextfieldWithWordCount.wordCountLabel.label, "Words: 5")
        // Clear text and ensure word count is set to zero
        Components.TextfieldWithWordCount.textField.tap()
        Components.TextfieldWithWordCount.textField.clearText()
        XCTAssertEqual(Components.TextfieldWithWordCount.wordCountLabel.label, "Words: 0")
        //Add two words and ensure word count is set to two
        Components.TextfieldWithWordCount.textField.tap()
        Components.TextfieldWithWordCount.textField.clearAndTypeText("Hello World")
        XCTAssertEqual(Components.TextfieldWithWordCount.wordCountLabel.label, "Words: 2")
        // Add Extra Spacing and check to ensure word count is still twoo
        Components.TextfieldWithWordCount.textField.tap()
        Components.TextfieldWithWordCount.textField.clearAndTypeText("Hello      World")
        XCTAssertEqual(Components.TextfieldWithWordCount.wordCountLabel.label, "Words: 2")


    }
}
