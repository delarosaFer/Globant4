import Foundation

final class DetailInteractor: PresenterToInteractorDetailProtocol {
    var presenter: InteractorToPresenterDetailProtocol?
    var workPlaceDetails: WorkPlaceModel?
    
    func getWorkplaceDetails() {
        guard let details = workPlaceDetails else {
            self.presenter?.noticeFailureGettingDetails()
            return
        }
        self.presenter?.workDetailsExist(workDetails: details)
    }
}
