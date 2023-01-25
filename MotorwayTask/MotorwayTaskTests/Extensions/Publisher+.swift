import Combine
import Foundation
// https://www.swiftbysundell.com/articles/unit-testing-combine-based-swift-code/
extension Published.Publisher {
    func collectNext(_ count: Int) -> AnyPublisher<[Output], Never> {
        self.dropFirst()
            .collect(count)
            .first()
            .eraseToAnyPublisher()
    }
}
