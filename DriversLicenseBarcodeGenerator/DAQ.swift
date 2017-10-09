import Foundation

class DAQ: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAQ\(DataElementFormatter.format(string: data, length: 25))"
    }
}
