import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            ViewBuilder.inputView()
                .tabItem {
                    Text("New")
                    Image(systemName: "pencil")
                }
            ViewBuilder.historyView()
                .tabItem {
                    Text("Old")
                    Image(systemName: "clock")
                }
        }
    }
}
