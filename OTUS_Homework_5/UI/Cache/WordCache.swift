
import Foundation

extension Notification.Name {
    static let wordCacheDidChange = Notification.Name(rawValue: "wordCacheDidChange")
}

class WordCache {
    private let defaultsKey = "OtusHomeworkDefaultsKey"
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func getLastUsed() -> [String] {
        return defaults.array(forKey: defaultsKey) as? [String] ?? []
    }
    
    func addText(string: String) {
        var lastUsed = getLastUsed()
        if !lastUsed.contains(string) {
            lastUsed.append(string)
        }
        
        defaults.setValue(lastUsed, forKey: defaultsKey)
        NotificationCenter.default.post(name: .wordCacheDidChange, object: nil)
    }
}
