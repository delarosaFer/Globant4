import XCTest
@testable import rhugodn

class DetailInteractorTests: XCTestCase {
    
    func testGetWorkplaceDetailsCalled() {
        let sut = DetailInteractor()
        let mockPresenter = MockDetailPresenter()
        guard let data = MockData().getMockData(),
            let workPlaceDetail: WorkPlaceModel = (try? JSONDecoder().decode([WorkPlaceModel].self, from: data))?.first else {
                XCTFail()
            return
        }
        sut.presenter = mockPresenter
        sut.workPlaceDetails = workPlaceDetail
        sut.getWorkplaceDetails()
        XCTAssertTrue(mockPresenter.workDetailExistCalled)
    }
    
    func testGetWorkplaceDetailsFailCalled() {
        
        let sut = DetailInteractor()
        let mockPresenter = MockDetailPresenter()
        sut.presenter = mockPresenter
        sut.workPlaceDetails = nil
        sut.getWorkplaceDetails()
        XCTAssertTrue(mockPresenter.noticeFailureGettingDetailsCalled)
    }
}
