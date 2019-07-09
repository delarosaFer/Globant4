import Foundation

@testable import rhugodn

class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func loadData(from url: URL, completion: @escaping NetworkSession.Completion) {
        completion(data, error)
    }
}
