import Foundation

class Barcode: NSCoding {
    let dataElements: [Any]
    let issuerIdentificationNumber: String
    let AAMVAVersionNumber: String
    let jurisdictionVersionNumber: String
    let dataElementSeparator = "\u{0A}"

    var data: Data {
        return description.data(using: String.Encoding.ascii)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(issuerIdentificationNumber, forKey: "issuerIdentificationNumber")
        aCoder.encode(AAMVAVersionNumber, forKey: "AAMVAVersionNumber")
        aCoder.encode(jurisdictionVersionNumber, forKey: "jurisdictionVersionNumber")
        // TODO: Encode dataElements
    }
    
    required init(coder aDecoder: NSCoder) {
        AAMVAVersionNumber = aDecoder.decodeObject(forKey: "AAMVAVersionNumber") as! String
        dataElements = []
        issuerIdentificationNumber = aDecoder.decodeObject(forKey: "issuerIdentificationNumber") as! String
        jurisdictionVersionNumber = aDecoder.decodeObject(forKey: "jurisdictionVersionNumber") as! String
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

        let subfileDesignator = "DL00300099"
        
        return "\(header)\(subfileDesignator)\(joined)"
    }
}


