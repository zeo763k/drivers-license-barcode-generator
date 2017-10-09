import Foundation

class DDF: DataElement<DataElementTruncation>, DataElementFormatable {
    func format() -> String {
        return "DDF\(DataElementFormatter.format(string: data.rawValue, length: 6))"
    }
}
