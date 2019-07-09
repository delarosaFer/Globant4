import Foundation
@testable import rhugodn

class MockData {
    func getMockData() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: File.mockData.rawValue, ofType: FileType.json.rawValue) else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        return data
    }
    
    func getMockModel() -> [WorkPlaceModel]? {
        guard let data = MockData().getMockData(),
            let workPlaceDetail: [WorkPlaceModel] = try? JSONDecoder().decode([WorkPlaceModel].self, from: data) else {
                return nil
        }
        
        return workPlaceDetail
    }
    
    func getFirstModel() -> WorkPlaceModel? {
        return self.getMockModel()?.first
    }
    
    func getBadFormattedData() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: File.mockWrongData.rawValue, ofType: FileType.json.rawValue) else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        return data
    }
}
