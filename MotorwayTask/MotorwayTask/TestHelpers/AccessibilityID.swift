import Foundation


enum AccessibilityID {

    enum Components {
        
        enum TextFieldWithCounter {
            static let textField = "TextField"
            static let label = "CounterLabel"
            static let view = "TextFieldWithCounterView"
        }

        enum Generic {
            static let textField = "TextField"
            static let label = "Label"
        }
    }

    enum Content {
        static let titleLabel = "Content.Title.Label"
        static let textField = Components.TextFieldWithCounter.view

    }

}
