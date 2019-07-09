import Foundation

protocol NetworkSession {
    typealias Completion = (Data?, Error?) -> Void
    func loadData(from url: URL, completion: @escaping Completion)
}

extension URLSession: NetworkSession {
    func loadData(from url: URL, completion: @escaping NetworkSession.Completion) {
        let task = dataTask(with: url) { (data, _, error) in
            completion(data, error)
        }
        task.resume()
    }
}
