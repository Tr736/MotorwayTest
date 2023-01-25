import Foundation
import SwiftUI
import Combine
protocol ContentViewModelType: ObservableObject {
    var text: String { get set }
    var wordCount: String { get set }
    func generateRandomWords()
    func observeTextForChanges()
}

class ContentViewModel: ContentViewModelType, TextFieldWithWordCountViewModelType {

    @Published var text: String = ""
    @Published var wordCount: String = "5"
    let randomWordGenerator: RandomWordGeneratorType

    private var cancellable = [AnyCancellable]()
    init(randomWordGenerator: RandomWordGeneratorType) {
        self.randomWordGenerator = randomWordGenerator
        self.observeTextForChanges()

        generateRandomWords()
    }

    func generateRandomWords() {
        Task {
            guard let wordCount = Int(self.wordCount) else { return }
            text = randomWordGenerator.getParagraph(maxWords: wordCount)
        }
    }

    func observeTextForChanges() {
        $text
            .receive(on: DispatchQueue.global(qos: .userInteractive))
            .sink { [weak self] value in
                guard !value.isEmpty else { return }
                let textArray = value.components(separatedBy: " ")
                let cleanedTextArray = textArray.filter { !($0.isEmpty || $0 == " ") }
                DispatchQueue.main.async {
                    self?.wordCount = "Words: \(cleanedTextArray.count)"

                }
            }.store(in: &cancellable)
    }
}

class MockContentViewModel: ContentViewModelType, TextFieldWithWordCountViewModelType {
    @Published var text: String = ""
    @Published var wordCount: String = "5"
    let randomWordGenerator: RandomWordGeneratorType
    private var cancellable = [AnyCancellable]()

    init(randomWordGenerator: RandomWordGeneratorType) {
        self.randomWordGenerator = randomWordGenerator
        generateRandomWords()
        self.observeTextForChanges()
    }

    func generateRandomWords() {
        Task {
            guard let wordCount = Int(self.wordCount) else { return }
            text = randomWordGenerator.getParagraph(maxWords: wordCount)
        }
    }

    func observeTextForChanges() {
        $text
            .receive(on: DispatchQueue.global(qos: .userInteractive))
            .sink { [weak self] value in
                let textArray = value.components(separatedBy: " ")
                let cleanedTextArray = textArray.filter { !($0.isEmpty || $0 == " ") }
                DispatchQueue.main.async {
                    self?.wordCount = "Words: \(cleanedTextArray.count)"

                }
            }.store(in: &cancellable)
    }
}
