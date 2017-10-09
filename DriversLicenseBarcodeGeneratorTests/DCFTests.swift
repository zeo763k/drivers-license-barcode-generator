import XCTest

class DCFTests: XCTestCase {
    func testFormat() {
        let dataElement = DCF("REALLY-LONG-DOCUMENT-DISCRIMINATOR")
        
        XCTAssertEqual(dataElement.format(), "DCFREALLY-LONG-DOCUMENT-DISC")
    }
}
