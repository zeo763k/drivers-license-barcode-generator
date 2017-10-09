import Foundation

class DCB: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCB\(DataElementFormatter.format(string: data, length: 40))"
    }    
}
