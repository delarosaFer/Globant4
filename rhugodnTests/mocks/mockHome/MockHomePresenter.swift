@testable import rhugodn
import Foundation

class MockHomePresenter: ViewToPresenterHomeProtocol, InteractorToPresenterHomeProtocol {
  
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    var startFetchingWorkPlacesCalled: Bool = false
    var showDetailControllerCalled: Bool = false
    var workFetchSuccessCalled: Bool = false
    var noticeFetchFailedCalled:  Bool = false
    var loadImageCalled:Bool = false
    
    func startFetchingWorkPlaces() {
        startFetchingWorkPlacesCalled = true
    }
    
    func showDetailController(workPlace: WorkPlaceModel, originViewController: HomeViewController) {
        showDetailControllerCalled = true
    }
    
    func workFetchSuccess(workPlacesModelArray: [WorkPlaceModel]) {
        workFetchSuccessCalled = true
    }
    
    func noticeFetchFailed(message: String) {
        noticeFetchFailedCalled = true
    }
    
    func loadImage(data: Data) {
        loadImageCalled = true
    }
}
