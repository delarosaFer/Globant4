import UIKit

protocol PresenterToRouterHomeProtocol: class {
    static func createModule() -> HomeViewController
    func pushToDetailScreen(workPlace: WorkPlaceModel, originViewController: HomeViewController)
}

protocol ViewToPresenterHomeProtocol: class {
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }

    func startFetchingWorkPlaces()
    func showDetailController(workPlace: WorkPlaceModel, originViewController: HomeViewController)
}

protocol PresenterToViewHomeProtocol: class {
    func showWorkPlaces(workArray: [WorkPlaceModel])
    func showError(message: String)
    func showImage(image: Data)
}

protocol PresenterToInteractorHomeProtocol: class {
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    func fetchWorkPlaces(_ link: String)
    func fetchImage(_ link: String)
    func decodeWorkplaces(data: Data) -> [WorkPlaceModel]?
}

protocol InteractorToPresenterHomeProtocol: class {
    func workFetchSuccess(workPlacesModelArray: [WorkPlaceModel])
    func noticeFetchFailed(message: String)
    func loadImage(data: Data)
}
