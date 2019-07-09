@testable import rhugodn

class MockDetailRouter: PresenterToRouterDetailProtocol {
    
    static var createDetailModuleWithCalled: Bool = false
    
    static func createDetailModuleWith(workPlace: WorkPlaceModel) -> DetailViewController {
        createDetailModuleWithCalled = true
        return DetailViewController()
    }
}
