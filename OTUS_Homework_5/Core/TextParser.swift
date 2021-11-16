import Combine
import OrderedCollections
import Foundation

final class TextParser: ObservableObject {
//    @Published var suffixTuples: [(String, Int)] = []
//    @Published var topTriads: [String] = []
    
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
//        let suffixDict = suffixes.reduce(into: [Substring:Int]()) { partialResult, suffix in
//            let count = partialResult[suffix] ?? 0
//            partialResult[suffix] = count + 1
//        }
//
//        suffixTuples = suffixDict.keys.sorted().reduce(into: [(String, Int)](), { partialResult, suffix in
//            partialResult.append((String(suffix), suffixDict[suffix] ?? 0))
//        })
//
//        topTriads = suffixDict.filter{ $0.key.count == 3 }
//                            .sorted(by: { $1.key > $0.key })
//                            .prefix(10)
//                            .map{ String($0.key) }
        
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


