import Foundation

protocol RandomWordGeneratorType {
    func getWord() -> String
    func getParagraph(maxWords: Int) -> String
}


struct RandomWordGenerator: RandomWordGeneratorType {
    func getWord() -> String {
        var word: String = String()
        for _ in 0..<5{
            let string = String(format: "%c", Int.random(in: 97..<123)) as String
            word+=string
        }
        return word
    }

    func getParagraph(maxWords: Int) -> String {
        var word: String = String()
        for _ in 0..<maxWords {
            let newWord = getWord()
            word += " \(newWord)"
        }
        return word
    }
}

struct MockRandomWordGenerator: RandomWordGeneratorType {
    func getWord() -> String {
        return "Hello"
    }

    func getParagraph(maxWords: Int) -> String {
        return "Hello World"
    }
}
