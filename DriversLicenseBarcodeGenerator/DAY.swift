import Foundation

class DAY: DataElement<DataElementEyeColor>, DataElementFormatable {
    func format() -> String {
        return "DAY\(DataElementFormatter.format(string: data.rawValue, length: 3))"
    }
}
