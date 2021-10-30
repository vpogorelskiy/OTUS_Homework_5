import SwiftUI

enum ViewBuilder {
    static func inputView() -> some View {
        TextInputView()
    }
    
    static func detailView(inputText: String) -> some View {
        DetailView(inputText: inputText)
    }
    
}
