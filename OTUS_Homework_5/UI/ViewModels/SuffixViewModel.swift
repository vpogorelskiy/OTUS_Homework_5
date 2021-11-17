import Combine
import DI
import Foundation

final class SuffixViewModel: ObservableObject {
    @Published var suffixes: [SuffixViewModelItem] = []
    @Published var topTriads: [String] = []
    @Published var searchText: String = ""
    
    // MARK: Private vars
    
    private var allSuffixes: [SuffixViewModelItem] = [] {
        didSet {
            suffixes = allSuffixes
        }
    }
    
    private var debouncedText: String = "" {
        didSet {
            guard !debouncedText.isEmpty else {
                suffixes = allSuffixes
                return
            }
            
            suffixes = allSuffixes.filter{ item in
                item.suffix.localizedCaseInsensitiveContains(debouncedText)  //  contains(debouncedText)
            }
        }
    }
    private var subscriptions = Set<AnyCancellable>()
    
    @Injected private var textParser: TextParser!
    
    private var text: String = ""
    
    init(text: String) {
        self.text = text
        analyze()
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { debounced in
                self.debouncedText = debounced
            }
            .store(in: &subscriptions)
    }
    
    func analyze() {
        textParser.container(for: text) { [weak self] textContainer in
            let suffixes = textContainer.suffixes
            let suffixDict = suffixes.reduce(into: [Substring:Int]()) { partialResult, suffix in
                let count = partialResult[suffix] ?? 0
                partialResult[suffix] = count + 1
            }
            
            self?.allSuffixes = suffixDict.keys.sorted().reduce(into: [SuffixViewModelItem](), { partialResult, suffix in
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
