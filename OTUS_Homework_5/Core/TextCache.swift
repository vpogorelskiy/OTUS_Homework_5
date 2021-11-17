
import Foundation

extension Notification.Name {
    static let wordCacheDidChange = Notification.Name(rawValue: "wordCacheDidChange")
    static let suffixCacheDidChange = Notification.Name(rawValue: "suffixCacheDidChange")
}

class TextCache {
    private let defaultsTextsKey = "OtusHomeworkDefaultsKeyTexts"
    private let defaultsSuffixKey = "OtusHomeworkDefaultsKeySuffixes"
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func getTextHistory() -> [String] {
        return defaults.array(forKey: defaultsTextsKey) as? [String] ?? []
    }
    
    func addText(string: String) {
        var lastUsed = getTextHistory()
        guard !lastUsed.contains(string) else { return }
        
        lastUsed.append(string)
        defaults.setValue(lastUsed, forKey: defaultsTextsKey)
        NotificationCenter.default.post(name: .wordCacheDidChange, object: nil)
    }
    
    func getSuffixSearchHistory() -> [String: Double] {
        return defaults.dictionary(forKey: defaultsSuffixKey) as? [String: Double] ?? [:]
    }
    
    func addSuffixSearch(suffix: String, duration: Double) {
        var lastUsed = getSuffixSearchHistory()
        guard lastUsed[suffix] == nil else { return }
        lastUsed[suffix] = duration
        
        defaults.setValue(lastUsed, forKey: defaultsSuffixKey)
        NotificationCenter.default.post(name: .suffixCacheDidChange, object: nil)
    }
}
