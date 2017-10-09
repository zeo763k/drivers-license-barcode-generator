import Foundation

class DCD: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCD\(DataElementFormatter.format(string: data, length: 5))"
    }
}
