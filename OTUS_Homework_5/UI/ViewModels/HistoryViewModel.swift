import Combine
import Foundation

class HistoryViewModel: ObservableObject {
    @Published var textHistory: [String]
    private var cache: TextCache

    init(cache: TextCache = .init()) {
        self.cache = cache
        textHistory = cache.getLastUsed().reversed()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onCacheDidChange),
                                               name: .wordCacheDidChange,
                                               object: nil)
    }
    
    @objc private func onCacheDidChange() {
        textHistory = cache.getLastUsed().reversed()
    }
}

