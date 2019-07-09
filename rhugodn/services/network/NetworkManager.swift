import Foundation

final class NetworkManager {
    private let session: NetworkSession

    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    func loadData(from url: URL, completion: @escaping (NetworkResult) -> Void ) {
        session.loadData(from: url) { (data, error) in
            if let data = data {
                completion(.success(data))
            } else {
                let error = error ?? NetworkError.unknown
                completion(.failure(error))
            }
        }
    }
}
