import Foundation

class DCS: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCS\(DataElementFormatter.format(string: data, length: 6))"
    }
}
