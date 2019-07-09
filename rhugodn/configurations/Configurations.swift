import Foundation

enum SetStingURL {
    static func string(forKey key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)
    }
}
