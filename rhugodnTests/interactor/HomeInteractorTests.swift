import XCTest
@testable import rhugodn

class HomeInteractorTests: XCTestCase {
    var mockSession: NetworkSessionMock = NetworkSessionMock()
    var sut: HomeInteractor?
    var mockPresenter: MockHomePresenter = MockHomePresenter()
    
    override func setUp() {
        mockSession = NetworkSessionMock()
        sut = HomeInteractor(withNetwork: NetworkManager(session: mockSession))
        mockPresenter = MockHomePresenter()
        sut?.presenter = mockPresenter
    }
    
    override func tearDown() {
        sut?.presenter = nil
        sut = nil
    }
    
    func testHomeInteractorFailedDataFetching() {
        mockSession.data = nil
        sut?.fetchWorkPlaces(URLTest.dummy.rawValue)
        
        XCTAssertTrue(mockPresenter.noticeFetchFailedCalled)
    }
    
    func testHomeInteractorWorkingPlacesSuccessfulFetching() {
        mockSession.data = MockData().getMockData()
        sut?.fetchWorkPlaces(URLTest.valid.rawValue)
    
        XCTAssertTrue(mockPresenter.workFetchSuccessCalled)
    }
    
    func testHomeInteractorInvalidFetching() {
        mockSession.data = MockData().getBadFormattedData()
        sut?.fetchWorkPlaces(URLTest.valid.rawValue)
        
        XCTAssertTrue(mockPresenter.noticeFetchFailedCalled)
    }
    
    func testHomeInteractorImageSuccessfulFetching() {
        mockSession.data = MockData().getMockData()
        sut?.fetchImage(URLTest.valid.rawValue)
        
        XCTAssertTrue(mockPresenter.loadImageCalled)
    }
    
    func testHomeInteractorImageInvalidFetching() {
        mockSession.data = nil
        sut?.fetchImage(URLTest.valid.rawValue)
        
        XCTAssertNotNil(sut)
        XCTAssertFalse(mockPresenter.loadImageCalled)
    }
}
