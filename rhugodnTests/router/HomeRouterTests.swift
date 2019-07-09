import XCTest
@testable import rhugodn

class HomeRouterTests: XCTestCase {
    func testHomeRouterCreateDetailModuleWithWorkspaceArrayIsTrue() {
        let homeRouterTest = HomeRouter.createModule()
        guard let data = MockData().getMockData(),
            let workPlaceDetails: [WorkPlaceModel] = try? JSONDecoder().decode([WorkPlaceModel].self, from: data) else {
                XCTFail()
                return
        }
        homeRouterTest.workPlacesArrayList = workPlaceDetails
        
        guard let tableView = homeRouterTest.tableView else { return }
        XCTAssertNoThrow(homeRouterTest.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0)))
        XCTAssertNotNil(homeRouterTest)
    }
}
