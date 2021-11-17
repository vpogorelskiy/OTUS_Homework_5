import SwiftUI
import DI

enum ViewBuilder {
    static func registerDependencies() {
        Resolver.sharedInstance.register(TextParser.self) { r in
            TextParser()
        }
        
        Resolver.sharedInstance.register(TextCache.self) { r in
            TextCache()
        }
    }
    
    static func rootView() -> some View {
        RootView()
    }
    
    static func inputView() -> some View {
        TextInputView(viewModel: InputViewModel())
    }
    
    static func detailView(text: String) -> some View {
        let vm = SuffixViewModel(text: text)
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
