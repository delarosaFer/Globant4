import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView? = UITableView()
    @IBOutlet weak var profileImage: UIImageView?
    
    var presenter: ViewToPresenterHomeProtocol?
    var workPlacesArrayList: [WorkPlaceModel] = []

     override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .mainColor
        profileImage?.rounded()
        presenter?.startFetchingWorkPlaces()
        tableView?.register(WorkSpaceCell.self, forCellReuseIdentifier: CellIdentifier.workplaceCell.rawValue)
        tableView?.delegate = self
        tableView?.dataSource = self
    }

     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func setupUI() {
        let margins = super.view.safeAreaLayoutGuide
        self.tableView?.translatesAutoresizingMaskIntoConstraints = false
        self.tableView?.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.tableView?.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.tableView?.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.tableView?.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}

extension HomeViewController: PresenterToViewHomeProtocol {
    func showImage(image: Data) {
        DispatchQueue.main.async { [weak self] in
            self?.profileImage?.image = UIImage(data: image)
        }
    }
    
    func showWorkPlaces(workArray: [WorkPlaceModel]) {
        self.workPlacesArrayList = workArray
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }

    func showError(message: String) {
        self.present(showErrorAlert(message), animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workPlacesArrayList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return populateCell(withTableView: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showDetailController(workPlace: workPlacesArrayList[indexPath.row],
                                        originViewController: self)
    }

    private func populateCell(withTableView: UITableView, indexPath: IndexPath) -> WorkSpaceCell {
        guard let cell = tableView?.dequeueReusableCell(
            withIdentifier: CellIdentifier.careerCell.rawValue,
            for: indexPath) as? WorkSpaceCell else {
                return WorkSpaceCell()
        }

        cell.companyTitle?.text = workPlacesArrayList[indexPath.row].companyTitle
        cell.startingDate?.text = "\(NSLocalizedString(DateString.from.rawValue, comment: Comment.startDate.rawValue)) \(workPlacesArrayList[indexPath.row].startingDate)"
        cell.endingDate?.text = "\(NSLocalizedString(DateString.to.rawValue, comment: Comment.endDate.rawValue)) \(workPlacesArrayList[indexPath.row].finishingDate)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
