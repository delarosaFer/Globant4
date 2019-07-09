@testable import rhugodn
import Foundation

class MockHomeInteractor: PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol?
    var fetchWorkPlacesCalled: Bool = false
    var fetchImageCalled: Bool = false
    var decodeWorkplacesCalled: Bool = false
    
    func fetchWorkPlaces(_ link: String) {
        fetchWorkPlacesCalled = true
    }
    
    func fetchImage(_ link: String) {
        fetchImageCalled = true
    }
    
    func decodeWorkplaces(data: Data) -> [WorkPlaceModel]? {
        decodeWorkplacesCalled = true
        return nil
    }
}
