import SwiftUI

enum ViewBuilder {
    static func inputView() -> some View {
        TextInputView()
    }
    
    static func detailView(inputText: String) -> some View {
        let vm = DetailViewModel(text: inputText)
        
        return SegmentedView(childViews: ["Statistics": AnyView(SuffixesView(viewModel: vm)),
                                          "Top triads": AnyView(TriadsView(viewModel: vm))])
            .navigationTitle("Text suffixes")
    }
}
