import Foundation

class DAD: DataElement<[String]>, DataElementFormatable {
    func format() -> String {
        return "DAD\(DataElementFormatter.format(string: data.joined(separator: ","), length: 40))"
    }
}
