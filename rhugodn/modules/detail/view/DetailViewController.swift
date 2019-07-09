import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet var workPlaceTitleLabel: UILabel?
    @IBOutlet var workPlaceFromLabel: UILabel?
    @IBOutlet var workPlaceToLabel: UILabel?
    @IBOutlet var workPlaceDetails: UITextView?
    @IBOutlet weak var fromLabel: UILabel?
    @IBOutlet weak var toLabel: UILabel?
    
    
    var presenter: ViewToPresenterDetailProtocol?

     override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .mainColor
        
        presenter?.displayWorkPlaceDetail()
    }
    
    private func setupView() {
        fromLabel?.text = NSLocalizedString(DateString.from.rawValue, comment: Comment.startDate.rawValue)
        toLabel?.text = NSLocalizedString(DateString.to.rawValue, comment: Comment.endDate.rawValue)
    }
}

extension DetailViewController: PresenterToViewDetailProtocol {
   
    func showDetails(workDetails: WorkPlaceModel) {
        self.workPlaceTitleLabel?.text = workDetails.companyTitle
        self.workPlaceFromLabel?.text = workDetails.startingDate
        self.workPlaceToLabel?.text = workDetails.finishingDate
        self.workPlaceDetails?.text = workDetails.description
    }

    func showError() {
        self.present(showErrorAlert(), animated: true, completion: nil)
    }
}
