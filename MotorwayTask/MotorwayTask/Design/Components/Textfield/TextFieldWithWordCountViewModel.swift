import Foundation
protocol TextFieldWithWordCountViewModelType: ObservableObject {
    var text: String { get set }
    var wordCount: String { get set }
}

class MockTextFieldWithWordCountViewModel: TextFieldWithWordCountViewModelType {
    var text: String = ""
    var wordCount: String = ""
}
