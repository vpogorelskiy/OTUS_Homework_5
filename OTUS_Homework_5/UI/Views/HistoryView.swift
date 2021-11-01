import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel = HistoryViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.textHistory, id: \.self) { text in
                    NavigationLink(text) {
                        NavigationLazyView(ViewBuilder.detailView(inputText: text))
                    }
                }
            }.navigationTitle("Search history")
        }
    }
}
