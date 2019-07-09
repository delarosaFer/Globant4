
import Foundation

@testable import rhugodn

class MockDetailIntercator: PresenterToInteractorDetailProtocol, InteractorToPresenterDetailProtocol {
    
    var presenter: InteractorToPresenterDetailProtocol? 
    var workPlaceDetails: WorkPlaceModel?
    var getWorkPlaceCalled: Bool = false
    var workDetailExistCalled: Bool = false
    var noticeFailureCalled: Bool = false
    
    func getWorkplaceDetails() {
        getWorkPlaceCalled = true
    }
    
    func workDetailsExist(workDetails: WorkPlaceModel) {
        workDetailExistCalled = true
    }
    
    func noticeFailureGettingDetails() {
        noticeFailureCalled = true
    }
}
