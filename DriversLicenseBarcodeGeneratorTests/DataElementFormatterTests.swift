import XCTest

class DataElementFormatterTests: XCTestCase {
    let date = buildDate(year: 1986, month: 9, day: 14)!

    func testFormatString() {
        XCTAssertEqual(DataElementFormatter.format(string: "KYLEDECOT", length: 5), "KYLED")
    }

    func testFormatPostalCode() {
        XCTAssertEqual(DataElementFormatter.format(postalCode: "43212"), "432120000")
    }

    func testFormatDate() {
        XCTAssertEqual(DataElementFormatter.format(date: date), "09141986")
    }

    func testFormatEyeColor() {
        XCTAssertEqual(DataElementFormatter.format(eyeColor: .Hazel), "HAZ")
    }

    func testFormatHeight() {
        XCTAssertEqual(DataElementFormatter.format(height: 70), "70 IN")
    }
    
    fileprivate static func buildDate(year: Int, month: Int, day: Int) -> Date! {
        let calendar = NSCalendar.current

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        return calendar.date(from: dateComponents as DateComponents)!
    }
}
