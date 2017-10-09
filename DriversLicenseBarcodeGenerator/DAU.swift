import Foundation

class DAU: DataElement<Int>, DataElementFormatable {
    func format() -> String {
        return "DAU\(DataElementFormatter.format(height: data))"
    }
}
