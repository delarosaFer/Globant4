@testable import rhugodn

class MockHomeRouter: PresenterToRouterHomeProtocol {
    
    static var createModuleCalled: Bool = false
    var pushtoDetailScreenCalled: Bool = false
    
    static func createModule() -> HomeViewController {
        createModuleCalled = true
        return HomeViewController()
    }
    
    func pushToDetailScreen(workPlace: WorkPlaceModel, originViewController: HomeViewController) {
        pushtoDetailScreenCalled = true
    }
}
