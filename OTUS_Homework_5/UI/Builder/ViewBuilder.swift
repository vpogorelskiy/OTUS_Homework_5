import SwiftUI

enum ViewBuilder {
    static func rootView() -> some View {
        RootView()
    }
    
    static func inputView() -> some View {
        TextInputView(viewModel: SuffixViewModel())
    }
    
    static func detailView(text: String) -> some View {
        let vm = SuffixViewModel()
        vm.text = text
        vm.analyze()
        return detailView(vm: vm)
    }
    
    static func detailView(vm: SuffixViewModel) -> some View {
        return SegmentedView(childViews: ["Statistics": AnyView(SuffixesView(viewModel: vm)),
                                          "Top triads": AnyView(TriadsView(viewModel: vm))])
            .navigationTitle("Text suffixes")
    }
    
    static func historyView() -> some View {
        HistoryView()
    }
}
