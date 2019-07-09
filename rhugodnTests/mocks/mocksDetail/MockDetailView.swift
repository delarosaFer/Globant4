@testable import rhugodn

class MockDetailView: PresenterToViewDetailProtocol {
    
    var showDetailsCalled: Bool = true
    var showErrorCalled: Bool = true
    
    func showDetails(workDetails: WorkPlaceModel) {
        showDetailsCalled = true
    }
    
    func showError() {
        showErrorCalled = true
    }
    
    
}
