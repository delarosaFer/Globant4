import XCTest
@testable import rhugodn

class HomePresenterTests: XCTestCase {
    
    func testStartFetchingWorkPlaces() {
       
        let sut = HomePresenter()
        let mockInteractor = MockHomeInteractor()
        
        sut.interactor = mockInteractor
        sut.startFetchingWorkPlaces()
      
        
        XCTAssertTrue(mockInteractor.fetchWorkPlacesCalled)
        XCTAssertTrue(mockInteractor.fetchImageCalled)
    }
    
    func testShowDetailController() {
        let sut = HomePresenter()
        let mockRouter = MockHomeRouter()
        guard let data = MockData().getMockData(),
            let workPlaceDetail: WorkPlaceModel = (try? JSONDecoder().decode([WorkPlaceModel].self, from: data))?.first else {
                XCTFail()
                return
        }
        
        sut.router = mockRouter
        sut.showDetailController(workPlace: workPlaceDetail, originViewController: HomeViewController())
        
        XCTAssertTrue(mockRouter.pushtoDetailScreenCalled)
    }
    
    func testWorkFetchSuccess() {
        let sut = HomePresenter()
        let mockView = MockHomeView()
        guard let data = MockData().getMockData(),
            let workPlaceDetails: [WorkPlaceModel] = try? JSONDecoder().decode([WorkPlaceModel].self, from: data) else {
                XCTFail()
                return
        }
    
        sut.view = mockView
        sut.workFetchSuccess(workPlacesModelArray: workPlaceDetails)
        
        XCTAssertTrue(mockView.showWorkPlacesCalled)
    }
    
    func testNoticeFetchFailed() {
        let sut = HomePresenter()
        let mockView = MockHomeView()
        let message = Fail.message.rawValue
        
        sut.view = mockView
        sut.noticeFetchFailed(message: message)
        
        XCTAssertTrue(mockView.showErrorCalled)
    }
    
    func testLoadImageFromData() {
        let sut = HomePresenter()
        let mockView = MockHomeView()
        guard let data = MockData().getMockData() else {
            XCTFail()
            return
        }
        
        sut.view = mockView
        sut.loadImage(data: data)
        
        XCTAssertTrue(mockView.showImageCalled)
    }
}
