import XCTest
import Combine
@testable import MotorwayTask
final class ContentViewModelTests: XCTestCase {

    private var sut: ContentViewModel!
    private var mockWordGenerator: RandomWordGeneratorType!
    override func setUpWithError() throws {
        mockWordGenerator = MockRandomWordGenerator()
        sut = ContentViewModel(randomWordGenerator: mockWordGenerator)
    }

    override func tearDownWithError() throws {
        mockWordGenerator = nil
        sut = nil
    }

    func test_generateRandomWords() {
        let expectation = self.expectation(description: "Awaiting publisher")
        let cancellable = sut.$wordCount
            .dropFirst().sink { value in
            expectation.fulfill()
        }

        waitForExpectations(timeout: 10)
        cancellable.cancel()

        XCTAssertEqual(sut.wordCount, "Words: 2")
        XCTAssertEqual(sut.text, "Hello World")
    }
}
