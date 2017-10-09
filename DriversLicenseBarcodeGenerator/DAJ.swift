import Foundation

// TODO: Have this accept an enum instead of string
class DAJ: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAJ\(DataElementFormatter.format(string: data, length: 2))"
    }
}
