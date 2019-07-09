import XCTest

class UserInterfaceTest: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testHomeTableView() {
        let app = XCUIApplication()
        let homeTable = app.tables
        let companyLabel = homeTable.staticTexts["companyLabel"]
        let startDate = homeTable.staticTexts["startDateLabel"]
        let endDate = homeTable.staticTexts["endDateLabel"]
        
        homeTable.otherElements["homeView"].swipeDown()
        homeTable.otherElements["homeView"].swipeUp()
        XCTAssert(companyLabel.exists)
        XCTAssert(startDate.exists)
        XCTAssert(endDate.exists)
    }
    
    func testDatailView() {
        
        let app = XCUIApplication()
        let cell = app.tables.children(matching: .cell).element(boundBy: 0)
        
        cell.tap()
        
        let workplace = app.staticTexts["workplaceTitle"]
        let fromDate = app.staticTexts["fromDataLabel"]
        let realFromDate = app.staticTexts["realFromDate"]
        let toDate = app.staticTexts["toDateLabel"]
        let realToDate = app.staticTexts["realToDate"]
        let summary = app.textViews["summaryWorkplace"]
        
        XCTAssert(workplace.exists)
        XCTAssert(fromDate.exists)
        XCTAssert(toDate.exists)
        XCTAssert(realToDate.exists)
        XCTAssert(realFromDate.exists)
        XCTAssert(summary.exists)
    }
}
