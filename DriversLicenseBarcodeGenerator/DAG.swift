import Foundation

class DAG: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAG\(DataElementFormatter.format(string: data, length: 35))"
    }
}
