
import Foundation

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
        lastUsed.append(string)
        defaults.setValue(lastUsed, forKey: defaultsKey)
    }
    
}
