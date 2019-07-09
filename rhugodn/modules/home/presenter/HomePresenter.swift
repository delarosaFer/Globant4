import UIKit

final class HomePresenter: ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func startFetchingWorkPlaces() {
        interactor?.fetchWorkPlaces(apiWorkingPlacesList)
        interactor?.fetchImage(URLString.profilePicture.rawValue)
    }
    
    func showDetailController(workPlace: WorkPlaceModel, originViewController: HomeViewController) {
        router?.pushToDetailScreen(workPlace: workPlace, originViewController: originViewController)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
    func workFetchSuccess(workPlacesModelArray: [WorkPlaceModel]) {
        view?.showWorkPlaces(workArray: workPlacesModelArray)
    }

    func noticeFetchFailed(message: String) {
        view?.showError(message: message)
    }
    
    func loadImage(data: Data) {
        view?.showImage(image: data)
    }
}

