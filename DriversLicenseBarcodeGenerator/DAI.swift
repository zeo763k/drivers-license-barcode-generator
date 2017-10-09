import Foundation

class DAI: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAI\(DataElementFormatter.format(string: data, length: 20))"
    }
}
