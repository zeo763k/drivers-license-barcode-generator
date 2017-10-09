import Foundation

class DCG: DataElement<DataElementCountryIdentificationCode>, DataElementFormatable {    
    func format() -> String {
        return "DCG\(DataElementFormatter.format(string: data.rawValue, length: 6))"
    }
}
