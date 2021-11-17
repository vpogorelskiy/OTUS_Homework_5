import Foundation
import DI

final class InputViewModel: ObservableObject {
    @Published var text: String = ""
    
    @Injected private var wordCache: TextCache!
    
    func analyze() {
        wordCache.addText(string: text)
    }
}
