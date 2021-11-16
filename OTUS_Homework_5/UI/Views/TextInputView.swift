import SwiftUI

struct TextInputView: View {
    
    @ObservedObject var viewModel: SuffixViewModel
    
//    @State private var inputText: String = ""
    
    var body: some View {
        UITextField.appearance().clearButtonMode = .whileEditing
        return NavigationView {
            VStack {
                TextEditor(text: $viewModel.text)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray ,lineWidth: 1))
                    .padding()

                ZStack {
                    NavigationLink("Analyze",
                                   destination: NavigationLazyView {
                        ViewBuilder.detailView(vm: viewModel)
                    }).simultaneousGesture(TapGesture().onEnded{
                        viewModel.analyze()
                    })
                    HStack {
                        Spacer()
                        Button {
                            viewModel.text = ""
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
        TextInputView(viewModel: SuffixViewModel())
    }
}
