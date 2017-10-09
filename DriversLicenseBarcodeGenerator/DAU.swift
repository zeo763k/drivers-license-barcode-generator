import Foundation

class DAU: DataElement<Int>, DataElementFormatable {
    func format() -> String {
        return "DAU\(DataElementFormatter.format(string: "\(data) IN", length: 6))"
    }
}
