import Combine
import OrderedCollections
import Foundation

final class TextParser: ObservableObject {
 
    var text: String = ""
    
    private(set) var textContainers: [Int: TextContainer] = [:]
    
    init() {}
    
    func container(for text: String, completion: @escaping (TextContainer) -> Void) {
        if let container = textContainers[text.hash] {
            completion(container)
            return
        }
        
        DispatchQueue.global().async {
            let cont = self.buildContainer(for: text)
            DispatchQueue.main.async {
                self.textContainers[text.hash] = cont
                completion(cont)
            }
        }
    }
    
    private func buildContainer(for text: String) -> TextContainer {
        let suffixes = text.suffixArray()
        
        return TextContainer(title: String(text.prefix(50)),
                             text: text,
                             suffixes: suffixes)
    }
    
    private func hasText(_ text: String) -> Bool {
        return textContainers.keys.contains(text.hash)
    }
    
}

struct TextContainer {
    let title: String
    let text: String
    let suffixes: [Substring]
}


