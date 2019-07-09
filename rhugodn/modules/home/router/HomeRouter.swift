import UIKit

final class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule() -> HomeViewController {

        let homeController = mainstoryboard.instantiateViewController(withIdentifier: ViewControllerName.homeViewController.rawValue)
        guard let view = homeController as? HomeViewController else {
            return HomeViewController()
        }
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        let interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
        let router: PresenterToRouterHomeProtocol = HomeRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }

    func pushToDetailScreen(workPlace: WorkPlaceModel, originViewController: HomeViewController) {
        let detailView = DetailRouter.createDetailModuleWith(workPlace: workPlace)
        originViewController.navigationController?.pushViewController(detailView, animated: true)
    }

    private static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardName.mainStoryboard.rawValue, bundle: Bundle.main)
    }
}
