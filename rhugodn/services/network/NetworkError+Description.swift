import Foundation

enum NetworkError: Error {
    case invalidData
    case unknown
    case invalidUrl
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString(NetworkErrorKey.invalidData.rawValue, comment: Comment.invalidData.rawValue)
        case .invalidUrl:
            return NSLocalizedString(NetworkErrorKey.invalidUrl.rawValue, comment: Comment.invalidUrl.rawValue)
        case .unknown:
            return NSLocalizedString(NetworkErrorKey.unknown.rawValue, comment: Comment.unknown.rawValue)
        }
    }
}
