
import XCTest
@testable import rhugodn

class DetailViewTests: XCTestCase {

    var sut: DetailViewController?
    
    override func setUp() {
        let storyBoard = UIStoryboard.init(name: StoryboardName.mainStoryboard.rawValue, bundle: Bundle.main)
        sut = storyBoard.instantiateViewController(withIdentifier: ViewControllerName.datailViewController.rawValue) as? DetailViewController
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testShowDetails() {
        guard let workplace = MockData().getMockModel()?.first else {
            XCTFail(Fail.notModel.rawValue)
            return
        }
        sut?.loadViewIfNeeded()
        
        sut?.showDetails(workDetails: workplace)
         
        XCTAssertEqual(workplace.companyTitle, sut?.workPlaceTitleLabel?.text )
        XCTAssertEqual(workplace.startingDate, sut?.workPlaceFromLabel?.text )
        XCTAssertEqual(workplace.finishingDate, sut?.workPlaceToLabel?.text )
        XCTAssertEqual(workplace.description, sut?.workPlaceDetails?.text )
        
    }

    func testSetupView() {
        guard let workplace = MockData().getMockModel()?.first else {
            XCTFail(Fail.notModel.rawValue)
            return
        }
        sut?.loadViewIfNeeded()
        
        sut?.showDetails(workDetails: workplace)
        
        XCTAssertEqual(workplace.companyTitle, sut?.workPlaceTitleLabel?.text )
        XCTAssertEqual(workplace.startingDate, sut?.workPlaceFromLabel?.text )
        XCTAssertEqual(workplace.finishingDate, sut?.workPlaceToLabel?.text )
        XCTAssertEqual(workplace.description, sut?.workPlaceDetails?.text )
    }

}
