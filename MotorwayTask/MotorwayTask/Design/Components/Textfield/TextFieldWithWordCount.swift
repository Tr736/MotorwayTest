import SwiftUI
import Combine


struct TextFieldWithWordCounter<ViewModel: TextFieldWithWordCountViewModelType>: View {
    @ObservedObject var viewModel: ViewModel
    @FocusState var isInputActive: Bool

    var body: some View {
        ZStack {
            TextField("",
                      text: $viewModel.text)
            .padding(.init(top: Grid.x2,
                           leading: Grid.x2,
                           bottom: Grid.x7,
                           trailing: Grid.x5))
            .foregroundColor(.primary)
            .background(.thinMaterial)
            .cornerRadius(GlobalDesignConstants.cornerRadius)
            .focused($isInputActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputActive = false
                    }
                }
            }
            .accessibilityIdentifier(AccessibilityID.Components.TextFieldWithCounter.textField)

            HStack {
                Spacer()
                Text(String(describing: $viewModel.wordCount.wrappedValue))
                    .padding(.init(top: Grid.x7,
                                   leading: 0,
                                   bottom: 0,
                                   trailing: Grid.x5))
                    .font(.footnote)
                    .accessibilityIdentifier(AccessibilityID.Components.TextFieldWithCounter.label)
            }

        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier(AccessibilityID.Components.TextFieldWithCounter.view)
    }
}

struct TextFieldWithWordCount_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MockTextFieldWithWordCountViewModel()
        viewModel.text = "Hello World"
        viewModel.wordCount = "2"
        return TextFieldWithWordCounter(viewModel: viewModel)
    }
}
