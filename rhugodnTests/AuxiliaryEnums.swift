import Foundation

//MARK: - Names of files
enum File: String {
    case mockData = "mockData"
    case mockWrongData = "mockWrongData"
}

//MARK: - Type of files
enum FileType: String {
    case json = "json"
}

//MARK: - Strings for fails
enum Fail: String {
    case notModel = "No model could be created"
    case notTableView = "There is no table view"
    case message = "dummy failed message"
    case notData = "no data should have been created"
}

//MARK: - URLs for test
enum URLTest: String {
    case dummy = "https://dummy_not_working_url"
    case valid = "https://www.valid-url.net"
    case url = "url"
}
