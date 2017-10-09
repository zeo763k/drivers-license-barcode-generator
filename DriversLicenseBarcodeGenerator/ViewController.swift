import Cocoa
import CoreImage

class ViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!
    
    @IBOutlet var firstNameTextField: NSTextField!
    @IBOutlet var middleNameTextField: NSTextField!
    @IBOutlet var lastNameTextField: NSTextField!
    
    @IBOutlet var address1TextField: NSTextField!
    @IBOutlet var cityTextField: NSTextField!
    @IBOutlet var zipTextField: NSTextField!
    @IBOutlet var statePopupButton: NSPopUpButton!
    
    @IBOutlet var expirationDatePicker: NSDatePicker!
    @IBOutlet var issueDatePicker: NSDatePicker!
    @IBOutlet var dateOfBirthDatePicker: NSDatePicker!
    @IBOutlet var sexPopupButton: NSPopUpButton!
    @IBOutlet var eyeColor: NSPopUpButton!
    @IBOutlet var customerIDNumberTextField: NSTextField!
    
    @IBOutlet var countryIdentificationPopup: NSPopUpButton!
    
    @IBOutlet var jurisdictionSpecificVehicleClassTextField: NSTextField!
    @IBOutlet var jurisdictionSpecificEndorsementCodesTextField: NSTextField!
    @IBOutlet var jurisdictionSpecificRestrictionCodesTextField: NSTextField!
    @IBOutlet var physicalDescriptionHeightTextField: NSTextField!
    @IBOutlet var documentDiscriminatorTextField: NSTextField!
    
    @IBOutlet var issuerIdentificationNumberTextField: NSTextField!
    @IBOutlet var AAMVAVersionNumberTextField: NSTextField!
    @IBOutlet var jurisdictionVersionNumberTextField: NSTextField!
    
    private var issuerIdentificationNumber: String {
        return issuerIdentificationNumberTextField.stringValue
    }
    
    private var AAMVAVersionNumber: String {
        return AAMVAVersionNumberTextField.stringValue
    }
    
    private var jurisdictionVersionNumber: String {
        return jurisdictionVersionNumberTextField.stringValue
    }
    
    private var document: Document {
        return view.window!.windowController!.document as! Document
    }

    private var jurisdictionSpecificEndorsementCodes: String {
        return jurisdictionSpecificEndorsementCodesTextField.stringValue
    }
    
    private var jurisdictionSpecificRestrictionCodes: String {
        return jurisdictionSpecificEndorsementCodesTextField.stringValue
    }
    
    private var jurisdictionSpecificVehicleClass: String {
        return jurisdictionSpecificVehicleClassTextField.stringValue
    }
    
    private var documentExpirationDate: Date {
        return expirationDatePicker.dateValue
    }

    private var customerFamilyName: String {
        return lastNameTextField.stringValue;
    }
    
    private var customerFirstName: String {
        return firstNameTextField.stringValue
    }
    
    private var customerMiddleNames: [String] {
        return [middleNameTextField.stringValue]
    }
    
    private var documentIssueDate: Date {
        return issueDatePicker.dateValue;
    }

    private var dateOfBirth: Date {
        return dateOfBirthDatePicker.dateValue
    }

    private var physicalDescriptionSex: DataElementGender {
        return .Male // TODO: Get this from the picker
    }
    
    private var physicalDescriptionEyeColor: DataElementEyeColor {
        let selectedItem = eyeColor.selectedItem!
        
        return DataElementEyeColor(rawValue: selectedItem.title)!
    }
    
    private var physicalDescriptionHeight: Int {
        return physicalDescriptionHeightTextField.integerValue
    }

    private var addressStreet1: String {
        return address1TextField.stringValue;
    }
    
    private var addressCity: String {
        return cityTextField.stringValue
    }

    private var addressJurisdictionCode: String {
        return statePopupButton.selectedItem!.title // TODO: Map this to an enum
    }

    private var addressPostalCode: String {
        return zipTextField.stringValue
    }
    
    private var customerIDNumber: String {
        return customerIDNumberTextField.stringValue
    }
    
    private var documentDiscriminator: String {
        return documentDiscriminatorTextField.stringValue
    }

    private var countryIdentification: DataElementCountryIdentificationCode {
        let selectedItem = countryIdentificationPopup.selectedItem!
        
        return DataElementCountryIdentificationCode(rawValue: selectedItem.title)!
    }
    
    var dataElements:[Any] {
        return [
            DCA(jurisdictionSpecificVehicleClass),
            DCB(jurisdictionSpecificRestrictionCodes),
            DCD(jurisdictionSpecificEndorsementCodes),
            DBA(documentExpirationDate),
            DCS(customerFamilyName),
            DAC(customerFirstName),
            DAD(customerMiddleNames),
            DBD(documentIssueDate),
            DBB(dateOfBirth),
            DBC(physicalDescriptionSex),
            DAY(physicalDescriptionEyeColor),
            DAU(physicalDescriptionHeight),
            DAG(addressStreet1),
            DAI(addressCity),
            DAJ(addressJurisdictionCode),
            DAK(addressPostalCode),
            DAQ(customerIDNumber),
            DCF(documentDiscriminator),
            DCG(countryIdentification),
            DDE(.No), // TODO: This should be calculated inside of barcode
            DDF(.No), // TODO: This should be calculated inside of barcode
            DDG(.No), // TODO: This should be calculated inside of barcode
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.wantsLayer = true
        imageView.layer?.backgroundColor = NSColor.lightGray.cgColor
        imageView.layer?.cornerRadius = 5
        
        configureJurisdicationCodeInput()
        configureCountryIdentificationInput()
        configurePhysicalDescriptionSexInput()
        configurePhysicalDescriptionHairColorInput()

        setDefaultValues()
    }
    
    fileprivate func setDefaultValues() {
//        firstNameTextField.stringValue = "Kyle"
//        middleNameTextField.stringValue = "Brandon"
//        lastNameTextField.stringValue = "Decot"
        jurisdictionSpecificVehicleClassTextField.stringValue = "D"
        
        dateOfBirthDatePicker.dateValue = Date(year: 1986, month: 9, day: 14)
        issueDatePicker.dateValue = Date(year: 2015, month: 9, day: 14)
        expirationDatePicker.dateValue = Date(year: 2019, month: 9, day: 14)
        
        physicalDescriptionHeightTextField.stringValue = "70"
        
        jurisdictionSpecificRestrictionCodesTextField.stringValue = "NONE"
        jurisdictionSpecificEndorsementCodesTextField.stringValue = "NONE"
        
        documentDiscriminatorTextField.stringValue = "1234567890123456789012345"
        
        issuerIdentificationNumberTextField.stringValue = "636000"
        AAMVAVersionNumberTextField.stringValue = "09"
        jurisdictionVersionNumberTextField.stringValue = "00"
    }
    
    fileprivate func configureJurisdicationCodeInput() {
        let jurisdictionCodes = ["AK", "AL", "AR", "AS", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"]
        
        statePopupButton.addItems(withTitles: jurisdictionCodes)
    }
    
    fileprivate func configurePhysicalDescriptionSexInput() {
        let options = ["1", "2", "3"] // TODO: male, female, not specified
        
        sexPopupButton.addItems(withTitles: options)
    }
    
    fileprivate func configurePhysicalDescriptionHairColorInput() {
       let options = ["BLK", "BLU", "BRO", "DIC", "GRY", "GRN", "HAZ", "MAR", "PNK", "UNK"]
        
        eyeColor.addItems(withTitles: options)
    }
    
    fileprivate func configureCountryIdentificationInput() {
        let countryIdentificationCodes = ["USA", "CAN"] // TODO: Get from enum
        countryIdentificationPopup.addItems(withTitles: countryIdentificationCodes)
    }

    // MARK: - Actions
    
    @IBAction func generate(sender: Any) {
        let barcode = Barcode(dataElements: dataElements, issuerIdentificationNumber: issuerIdentificationNumber, AAMVAVersionNumber: AAMVAVersionNumber, jurisdictionVersionNumber: jurisdictionVersionNumber)

        print(barcode)
        
        if let image = generatePDF417Barcode(from: barcode) {
            imageView.image = image

        }
    }

    // MARK: - Helpers
    
    func generatePDF417Barcode(from barcode: Barcode) -> NSImage? {
        if let filter = CIFilter(name: "CIPDF417BarcodeGenerator") {
            filter.setValue(barcode.data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                let cgImage = output.toCGImage()
                
                return NSImage(cgImage: cgImage!, size: NSSize(width: 500, height: 100))
            }
        }
        
        return nil
    }
 }

