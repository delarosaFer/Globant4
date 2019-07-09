@testable import rhugodn

class MockDetailPresenter: ViewToPresenterDetailProtocol, InteractorToPresenterDetailProtocol {
 
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
    var displayWorkPlaceDetailCalled: Bool = false
    var workDetailExistCalled: Bool = false
    var noticeFailureGettingDetailsCalled: Bool = false
    
    func displayWorkPlaceDetail() {
        displayWorkPlaceDetailCalled = true
    }
    
    func workDetailsExist(workDetails: WorkPlaceModel) {
        workDetailExistCalled = true
    }
    
    func noticeFailureGettingDetails() {
        noticeFailureGettingDetailsCalled = true
    }
    
}
