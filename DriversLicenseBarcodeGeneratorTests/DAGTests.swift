import XCTest

class DAGTests: XCTestCase {
    let dataElement = DAG("1437 CHESAPEAKE AVE")
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DAG1437 CHESAPEAKE AVE")
    }
}
