import Foundation

final class HomeInteractor: PresenterToInteractorHomeProtocol {
    let network: NetworkManager
    var presenter: InteractorToPresenterHomeProtocol?
    
    init(withNetwork network: NetworkManager = NetworkManager()) {
        self.network = network
    }
    
    func fetchWorkPlaces(_ link: String) {
        guard let url = URL.init(string: link) else {
            self.presenter?.noticeFetchFailed(message: NetworkError.invalidUrl.localizedDescription)
            return
        }
        
        network.loadData(from: url) { [weak self] (response) in
            switch response {
            case .success(let data):
                guard let workplaces = self?.decodeWorkplaces(data: data) else {
                    self?.presenter?.noticeFetchFailed(message: NetworkError.invalidData.localizedDescription)
                    return
                }
                self?.presenter?.workFetchSuccess(workPlacesModelArray: workplaces)
            case .failure(let error):
                self?.presenter?.noticeFetchFailed(message: error.localizedDescription)
            }
        }
    }
    
    func fetchImage(_ link: String) {
        guard let url = URL.init(string: link) else {
            return
        }
        
        network.loadData(from: url) { [weak self] (response) in
            switch response {
            case .success(let data):
                self?.presenter?.loadImage(data: data)
                return
            case .failure( _):
                return
            }
        }
    }
    
    func decodeWorkplaces(data: Data) -> [WorkPlaceModel]? {
        do {
            let workplaces = try JSONDecoder().decode([WorkPlaceModel].self, from: data)
            return workplaces
        } catch {
            return nil
        }
    }
}
