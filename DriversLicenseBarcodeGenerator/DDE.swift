import Foundation

class DDE: DataElement<DataElementTruncation>, DataElementFormatable {
    func format() -> String {
        return "DDE\(DataElementFormatter.format(string: data.rawValue, length: 1))"
    }
}
