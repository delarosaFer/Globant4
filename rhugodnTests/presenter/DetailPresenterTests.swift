import XCTest
@testable import rhugodn

class DetailPresenterTests {
    
    func testgetWorkPlaceCalled() {
       
        let sut = DetailPresenter()
        let mockView = MockDetailView()
        let mockInteractor = MockDetailIntercator()
        
        sut.interactor = mockInteractor
        sut.view = mockView
        sut.displayWorkPlaceDetail()
        
        XCTAssertTrue(mockInteractor.getWorkPlaceCalled)
    }
    
    func testWorkDetailsExist() {
        
        let sut = DetailPresenter()
        let mockView = MockDetailView()
        let mockInteractor = MockDetailIntercator()
        
        guard let data = MockData().getMockData(),
            let workPlaceDetail: WorkPlaceModel = (try? JSONDecoder().decode([WorkPlaceModel].self, from: data))?.first else {
                XCTFail()
                return
        }
        
        sut.interactor = mockInteractor
        sut.view = mockView
        sut.workDetailsExist(workDetails: workPlaceDetail)
        
        XCTAssertTrue(mockView.showDetailsCalled)
    }
    
    func testNoticeFailureGettingDetails() {
        
        let sut = DetailPresenter()
        let mockView = MockDetailView()
        let mockInteractor = MockDetailIntercator()
    
        sut.interactor = mockInteractor
        sut.view = mockView
        sut.noticeFailureGettingDetails()
        
        XCTAssertTrue(mockView.showErrorCalled)
    }
}

