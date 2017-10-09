import Foundation

class DBB: DataElement<Date>, DataElementFormatable {
    func format() -> String {
        return "DBB\(DataElementFormatter.format(date: data))"
    }
}
