import XCTest

class DAQTests: XCTestCase {
    let dataElement = DAQ("SS123123")
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "SS123123")
    }
}
