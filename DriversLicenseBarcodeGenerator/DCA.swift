import Foundation

class DCA: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCA\(DataElementFormatter.format(string: data, length: 6))"
    }
}
