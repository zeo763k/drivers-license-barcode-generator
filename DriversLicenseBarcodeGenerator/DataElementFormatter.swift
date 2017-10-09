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
    
    static func format(eyeColor: DataElementEyeColor) -> String {
        return DataElementFormatter.format(string: eyeColor.rawValue, length: 3)
    }
    
    static func format(height: Int) -> String {
        return DataElementFormatter.format(string: "\(height) IN", length: 6)
    }
}
