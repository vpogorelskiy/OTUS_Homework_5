import SwiftUI

struct NavigationLazyView<Content>: View where Content: View {
    let build: () -> Content
    
    public init(_ build: @escaping () -> Content) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
