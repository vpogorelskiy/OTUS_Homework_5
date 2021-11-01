import SwiftUI

struct TextInputView: View {
    
    @State private var inputText: String = ""
    
    var body: some View {
        UITextField.appearance().clearButtonMode = .whileEditing
        return NavigationView {
            VStack {
                TextEditor(text: $inputText)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray ,lineWidth: 1))
                    .padding()

                ZStack {
                    NavigationLink("Analyze",
                                   destination: NavigationLazyView(ViewBuilder.detailView(inputText: inputText)))
                    HStack {
                        Spacer()
                        Button {
                            inputText = ""
                        } label: {
                            Image(systemName: "xmark.circle")
                        }
                        .foregroundColor(.red)
                        Spacer().frame(width: 16)
                    }
                }
                
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
