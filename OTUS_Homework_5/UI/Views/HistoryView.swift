import SwiftUI

struct HistoryView: View {
    let viewModel = HistoryViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.textHistory, id: \.self) { text in
                    NavigationLink(text) {
                        NavigationLazyView(ViewBuilder.detailView(inputText: text))
                    }
                }
            }
        }
    }
}
