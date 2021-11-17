import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel = HistoryViewModel()
    
    
    var textHistoryView: some View {
        List {
            ForEach(viewModel.textHistory, id: \.self) { text in
                NavigationLink(text.prefix(50)) {
                    NavigationLazyView {
                        ViewBuilder.detailView(text: text)
                    }
                }
            }
        }.navigationTitle("Text history")
    }
    
    var suffixHistoryView: some View {
        List {
            ForEach(viewModel.textHistory, id: \.self) { text in
                NavigationLink(text.prefix(50)) {
                    NavigationLazyView {
                        ViewBuilder.detailView(text: text)
                    }
                }
            }
        }.navigationTitle("Suffix history")
    }
    
    var body: some View {
        NavigationView {
            
            SegmentedView(childViews: ["Text history": AnyView(textHistoryView),
                                       "Suffix history": AnyView(suffixHistoryView)])
                .navigationTitle("Text suffixes")
        }
    }
}
