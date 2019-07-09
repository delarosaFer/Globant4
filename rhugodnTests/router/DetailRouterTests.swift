import XCTest
@testable import rhugodn

class DetailRouterTests: XCTestCase {
    func testDetailRouterCreateDetailModuleWithWorkspaceIsTrue() {
        guard let data = MockData().getMockData(),
            let workPlaceDetail: WorkPlaceModel = (try? JSONDecoder().decode([WorkPlaceModel].self, from: data))?.first else {
                XCTFail()
                return
        }
        let detailRouterTest = DetailRouter.createDetailModuleWith(workPlace: workPlaceDetail)
        
        detailRouterTest.viewDidLoad()
        detailRouterTest.showError()
        detailRouterTest.showDetails(workDetails: workPlaceDetail)
        
        XCTAssertNotNil(detailRouterTest)
    }
}
