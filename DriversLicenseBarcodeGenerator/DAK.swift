import Foundation

class DAK: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAK\(DataElementFormatter.format(postalCode: data))"
    }
}
