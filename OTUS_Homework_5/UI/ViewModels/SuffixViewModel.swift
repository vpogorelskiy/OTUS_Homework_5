import Combine
import DI

final class SuffixViewModel: ObservableObject {
    @Published var suffixTuples: [SuffixViewModelItem] = []
    @Published var topTriads: [String] = []
    
    @Injected var textParser: TextParser!
    
    var text: String = ""
    
    init(text: String) {
        self.text = text
        analyze()
    }
    
    func analyze() {
        textParser.container(for: text) { [weak self] textContainer in
            let suffixes = textContainer.suffixes
            let suffixDict = suffixes.reduce(into: [Substring:Int]()) { partialResult, suffix in
                let count = partialResult[suffix] ?? 0
                partialResult[suffix] = count + 1
            }
            
            self?.suffixTuples = suffixDict.keys.sorted().reduce(into: [suffixTuples](), { partialResult, suffix in
                partialResult.append(SuffixViewModelItem(suffix: String(suffix), count: suffixDict[suffix] ?? 0))
            })
            
            self?.topTriads = suffixDict.filter{ $0.key.count == 3 }
                                .sorted(by: { $1.key > $0.key })
                                .prefix(10)
                                .map{ String($0.key) }
        }
    }
}

struct SuffixViewModelItem {
    let suffix: String
    let count: Int
}
