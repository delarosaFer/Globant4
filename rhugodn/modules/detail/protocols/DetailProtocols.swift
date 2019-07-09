import Foundation

protocol PresenterToRouterDetailProtocol: class {
    static func createDetailModuleWith(workPlace: WorkPlaceModel) -> DetailViewController
}

protocol ViewToPresenterDetailProtocol: class {
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }

    func displayWorkPlaceDetail()
}

protocol PresenterToViewDetailProtocol: class {
    func showDetails(workDetails: WorkPlaceModel)
    func showError()
}

protocol PresenterToInteractorDetailProtocol: class {
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    var workPlaceDetails: WorkPlaceModel? { get set }
    func getWorkplaceDetails()
}

protocol InteractorToPresenterDetailProtocol: class {
    func workDetailsExist(workDetails: WorkPlaceModel)
    func noticeFailureGettingDetails()
}
