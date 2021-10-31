import SwiftUI

enum ViewBuilder {
    static func inputView() -> some View {
        TextInputView()
    }
    
    static func detailView(inputText: String) -> some View {
        SegmentedView(childViews: ["Statistics": AnyView(Text("Statistics view")),
                                   "Top triads": AnyView(Text("Statistics view"))])
    }
}
