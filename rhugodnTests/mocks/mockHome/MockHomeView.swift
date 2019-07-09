@testable import rhugodn
import Foundation

class MockHomeView: PresenterToViewHomeProtocol {
    
    var showWorkPlacesCalled: Bool = false
    var showErrorCalled: Bool = false
    var showImageCalled: Bool = false
    
    func showWorkPlaces(workArray: [WorkPlaceModel]) {
        showWorkPlacesCalled = true
    }
    
    func showError(message: String) {
        showErrorCalled = true
    }
    
    func showImage(image: Data) {
        showImageCalled = true
    }
}
