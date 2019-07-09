import XCTest

@testable import rhugodn

class NetworkingTests: XCTestCase {
    
    func testGetData() {
        let session = NetworkSessionMock()
        let manager = NetworkManager(session: session)
        
        let data = Data(bytes: [0,1,0,1])
        
        session.data = data
        
        let url = URL(fileURLWithPath: URLTest.url.rawValue)
        
        manager.loadData(from: url) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure:
                XCTFail()
            }
        }
    }
    
    func testMissingData() {
        let session = NetworkSessionMock()
        let manager = NetworkManager(session: session)
        let data: Data? = nil
        session.data = data
        let url = URL(fileURLWithPath: URLTest.url.rawValue)
        manager.loadData(from: url) { (result) in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
    
    func testErrorEnum() {
        let session = NetworkSessionMock()
        let manager = NetworkManager(session: session)
        
        session.data = nil
        let url = URL(fileURLWithPath: URLTest.url.rawValue)
        
        manager.loadData(from: url) { (result) in
            switch result {
            case .success:
                XCTFail(Fail.notData.rawValue)
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.unknown.errorDescription)
            }
        }
    }
}
