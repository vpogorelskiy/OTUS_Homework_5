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
        let suffixes = viewModel.suffixHistory.sorted { $0.1 > $1.1 }
        let count = suffixes.count
        let alphaStep: Double = 1.0 / Double(count)
        
        return List {
            ForEach(0..<count) { i in
                ZStack {
                    Color.green.ignoresSafeArea().opacity(alphaStep * Double(i))
                    Color.red.ignoresSafeArea().opacity(alphaStep * Double(count - i))
                    Text("\(suffixes[i].0) - \(suffixes[i].1)s.")
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
