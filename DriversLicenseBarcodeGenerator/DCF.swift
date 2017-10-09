import Foundation

class DCF: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCF\(DataElementFormatter.format(string: data, length: 25))"
    }
}
