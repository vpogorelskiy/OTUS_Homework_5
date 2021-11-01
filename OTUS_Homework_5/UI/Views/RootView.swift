import SwiftUI

struct RootView: View {
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ViewBuilder.inputView()
                .tag(0)
                .tabItem {
                    Text("New")
                    Image(systemName: "pencil")
                }
            ViewBuilder.historyView()
                .tag(1)
                .tabItem {
                    Text("Old")
                    Image(systemName: "clock")
                }
        }.onOpenURL { url in
            switch url.absoluteString {
            case DeepLinks.newWordPath:
                selection = 0
            case DeepLinks.historyPath:
                selection = 1
            default: break
            }
        }
    }
}
