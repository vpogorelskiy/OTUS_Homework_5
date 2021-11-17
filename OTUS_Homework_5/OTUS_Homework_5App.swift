import SwiftUI

@main
struct OTUS_Homework_5App: App {
    
    init() {
        ViewBuilder.registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ViewBuilder.rootView()
        }
    }
}
