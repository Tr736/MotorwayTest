import SwiftUI
import Combine

struct ContentView<ViewModel: ContentViewModelType & TextFieldWithWordCountViewModelType>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Text("Random Word Generator")
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .accessibilityIdentifier(AccessibilityID.Content.titleLabel)
                Spacer()
                TextFieldWithWordCounter(viewModel: viewModel)
                Spacer()
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MockContentViewModel(randomWordGenerator: MockRandomWordGenerator()))
    }
}
