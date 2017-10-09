import Foundation

class DAC: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAC\(DataElementFormatter.format(string: data, length: 40))"
    }
}
