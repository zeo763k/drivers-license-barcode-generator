import Foundation

class DDG: DataElement<DataElementTruncation>, DataElementFormatable {
    func format() -> String {
        return "DDG\(DataElementFormatter.format(string: data.rawValue, length: 6))"
    }
}
