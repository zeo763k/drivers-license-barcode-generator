import Foundation

class Barcode {
    let dataElements: [Any]
    let issuerIdentificationNumber: String
    let AAMVAVersionNumber: String
    let jurisdictionVersionNumber: String
    let dataElementSeparator = "\u{0A}"

    var data: Data {
        return description.data(using: String.Encoding.ascii)!
    }

    init(dataElements: [Any], issuerIdentificationNumber: String, AAMVAVersionNumber: String, jurisdictionVersionNumber: String) {
        self.issuerIdentificationNumber = issuerIdentificationNumber
        self.dataElements = dataElements
        self.AAMVAVersionNumber = AAMVAVersionNumber
        self.jurisdictionVersionNumber = jurisdictionVersionNumber
    }
}

extension Barcode: CustomStringConvertible {
    var description: String {
        let header = Header(issuerIdentificationNumber: issuerIdentificationNumber, AAMVAVersionNumber: AAMVAVersionNumber, jurisdictionVersionNumber: jurisdictionVersionNumber, numberOfEntries: "\(dataElements.count)").description
        let formattedDataElemented = dataElements.map { ($0 as! DataElementFormatable).format() }
        let joined = formattedDataElemented.joined(separator: dataElementSeparator)

        let subfileDesignator = "DL00410278"
        
        return "\(header)\(subfileDesignator)\(joined)"
    }
}


