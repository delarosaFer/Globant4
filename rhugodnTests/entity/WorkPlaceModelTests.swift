@testable import rhugodn
import XCTest

class WorkPlaceModelTests: XCTestCase {
    func testWorkPlaceModelImpementCodable() {
        guard let data = MockData().getMockData(),
            let workPlaceDetail: WorkPlaceModel = (try? JSONDecoder().decode([WorkPlaceModel].self, from: data))?.first else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(workPlaceDetail.companyTitle,"Globant Mexico" )
        XCTAssertEqual(workPlaceDetail.description, "iOS Developer and Techlead in Globant Mexico, I've been working with different banking and fintech clients in Mexico and USA." )
        XCTAssertEqual(workPlaceDetail.identifier, "0" )
        XCTAssertEqual(workPlaceDetail.finishingDate, "Present" )
        XCTAssertEqual(workPlaceDetail.startingDate, "March 2017" )




    }
}
