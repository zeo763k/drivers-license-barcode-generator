import Foundation

class DataElementFormatter {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMddyyyy"
        
        return formatter
    }
    
    static func format(string: String, length: Int) -> String {
        return String(string.prefix(length))
    }
    
    static func format(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    static func format(postalCode: String) -> String {
        return postalCode.padding(toLength: 9, withPad: "0", startingAt: 0)
    }
}
