import SwiftUI

struct TextInputView: View {
    
    @State private var inputText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Text", text: $inputText)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                NavigationLink("Analyze",
                               destination: NavigationLazyView(ViewBuilder.detailView(inputText: inputText)))
            }
            .navigationTitle("Analyze input text")
        }
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView()
    }
}
