import UIKit

final class DetailRouter: PresenterToRouterDetailProtocol {
    static func createDetailModuleWith(workPlace: WorkPlaceModel) -> DetailViewController {
        let homeController = mainstoryboard.instantiateViewController(withIdentifier: ViewControllerName.datailViewController.rawValue)
        guard let view = homeController as? DetailViewController else {
            return DetailViewController()
        }
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        let interactor: PresenterToInteractorDetailProtocol = DetailInteractor()
        let router: PresenterToRouterDetailProtocol = DetailRouter()

        interactor.workPlaceDetails = workPlace

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }

    private static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardName.mainStoryboard.rawValue, bundle: Bundle.main)
    }
}
