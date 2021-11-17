import Combine
import Foundation

class HistoryViewModel: ObservableObject {
    @Published var textHistory: [String] = []
    @Published var suffixHistory: [(String, Double)] = []
    private var cache: TextCache

    init(cache: TextCache = .init()) {
        self.cache = cache
        updateTexts()
        updateSuffixes()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onTextCacheDidChange),
                                               name: .wordCacheDidChange,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onSuffixCacheDidChange),
                                               name: .suffixCacheDidChange,
                                               object: nil)
    }
    
    @objc private func onTextCacheDidChange() {
        updateTexts()
    }
    
    @objc private func onSuffixCacheDidChange() {
        updateSuffixes()
    }
    
    private func updateTexts() {
        textHistory = cache.getTextHistory().reversed()
    }
    
    private func updateSuffixes() {
        suffixHistory = cache.getSuffixSearchHistory().map{ ($0.key, $0.value) }
    }
}

