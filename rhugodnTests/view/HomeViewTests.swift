@testable import rhugodn
import XCTest

class HomeViewTests: XCTestCase {
    var sut: HomeViewController?
    
    override func setUp() {
        let storyBoard = UIStoryboard.init(name: StoryboardName.mainStoryboard.rawValue, bundle: Bundle.main)
        sut = storyBoard.instantiateViewController(withIdentifier: ViewControllerName.homeViewController.rawValue) as? HomeViewController
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testOutlets() {
        sut?.loadViewIfNeeded()

        XCTAssertNotNil(sut?.profileImage)
        XCTAssertNotNil(sut?.tableView)
    }
    
    func testTableViewShowsCorrectRowCount() {
        guard let workplaces = MockData().getMockModel() else {
            XCTFail(Fail.notModel.rawValue)
            return
        }
        
        sut?.loadViewIfNeeded()
        sut?.showWorkPlaces(workArray: workplaces)
        guard let tableView = sut?.tableView else {
            XCTFail(Fail.notTableView.rawValue)
            return
        }
        
        let rowCount = sut?.tableView(tableView, numberOfRowsInSection: 0) ?? 0
        XCTAssertEqual(rowCount, workplaces.count)
    }
    
    func testTableViewCellIntegrity() {
        guard let workplaces = MockData().getMockModel() else {
            XCTFail(Fail.notModel.rawValue)
            return
        }
        
        sut?.loadViewIfNeeded()
        sut?.showWorkPlaces(workArray: workplaces)
        
        guard let tableView = sut?.tableView else {
            XCTFail(Fail.notTableView.rawValue)
            return
        }
        for (index, workplace) in workplaces.enumerated() {
            let cell = sut?.tableView(tableView, cellForRowAt: IndexPath(row: index, section: 0)) as? WorkSpaceCell

            XCTAssertNotNil(cell)
            XCTAssertEqual(workplace.companyTitle, cell?.companyTitle?.text)
            XCTAssertEqual(NSLocalizedString(DateString.from.rawValue, comment: "") + " " + workplace.startingDate, cell?.startingDate?.text)
            XCTAssertEqual(NSLocalizedString(DateString.to.rawValue, comment: "") + " " + workplace.finishingDate, cell?.endingDate?.text)
        }
    }
}
