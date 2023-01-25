import XCTest
@testable import MotorwayTask
final class RandomWordGeneratorTests: XCTestCase {

    private var sut: RandomWordGenerator!

    override func setUpWithError() throws {
        sut = RandomWordGenerator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getWord_expectFiveLetter() {
        XCTAssertEqual(sut.getWord().count, 5)
    }


    func test_getParagraph_expectFive() {
        let paragraph = sut.getParagraph(maxWords: 5 )
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !($0.isEmpty || $0 == " ") }
        XCTAssertEqual(paragraph.count, 5)
    }

    func test_getParagraph_expectThree() {
        let paragraph = sut.getParagraph(maxWords: 3 )
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !($0.isEmpty || $0 == " ") }
        XCTAssertEqual(paragraph.count, 3)
    }

    func test_getParagraph_expectTwo() {
        let paragraph = sut.getParagraph(maxWords: 2 )
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !($0.isEmpty || $0 == " ") }
        XCTAssertEqual(paragraph.count, 2)
    }

    func test_getParagraph_expectOne() {
        let paragraph = sut.getParagraph(maxWords: 1 )
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !($0.isEmpty || $0 == " ") }
        XCTAssertEqual(paragraph.count, 1)
    }

    func test_getParagraph_expectZero() {
        let paragraph = sut.getParagraph(maxWords: 0 )
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !($0.isEmpty || $0 == " ") }
        XCTAssertEqual(paragraph.count, 0)
    }

    func test_getParagraph_expectFifty() {
        let paragraph = sut.getParagraph(maxWords: 50 )
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !($0.isEmpty || $0 == " ") }
        XCTAssertEqual(paragraph.count, 50)
    }

}
