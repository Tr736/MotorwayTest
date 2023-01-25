
import XCTest
@testable import MotorwayTask
final class GlobalDesignConstantsTests: XCTestCase {

    func test_cornerRadius_expectGridX2() {
        XCTAssertEqual(GlobalDesignConstants.cornerRadius, Grid.x2)
    }

}
