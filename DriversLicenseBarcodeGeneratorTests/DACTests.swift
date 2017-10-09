import XCTest

class DACTests: XCTestCase {
    func testFormat() {
        let dataElement = DAC("KYLE")
        
        XCTAssertEqual(dataElement.format(), "DACKYLE")
    }
}
