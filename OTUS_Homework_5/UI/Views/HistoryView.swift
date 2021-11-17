import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel = HistoryViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.textHistory, id: \.self) { text in
                    NavigationLink(text.prefix(50)) {
                        NavigationLazyView {
                            ViewBuilder.detailView(text: text)
                        }
                    }
                }
            }.navigationTitle("Search history")
        }
    }
}
