import Foundation

public extension Date {
    init(year: Int, month: Int, day: Int) {
        let calendar = NSCalendar.current

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        self.init(timeInterval: 0, since: calendar.date(from: dateComponents as DateComponents)!)
    }
}
