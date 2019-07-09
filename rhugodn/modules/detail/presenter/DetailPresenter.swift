import UIKit

final class DetailPresenter: ViewToPresenterDetailProtocol {

    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?

    func displayWorkPlaceDetail() {
        interactor?.getWorkplaceDetails()
    }
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func workDetailsExist(workDetails: WorkPlaceModel) {
        view?.showDetails(workDetails: workDetails)
    }

    func noticeFailureGettingDetails() {
        view?.showError()
    }
}
