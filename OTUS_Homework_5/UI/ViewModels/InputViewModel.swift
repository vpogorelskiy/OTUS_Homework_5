import Foundation
import DI

final class InputViewModel: ObservableObject {
    @Published var text: String = ""
    
    @Injected private var wordCache: WordCache!
    
    func analyze() {
        wordCache.addText(string: text)
    }
}
