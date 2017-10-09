import Cocoa

class Document: NSDocument {
    var barcode: Barcode
    
    override init() {
        barcode = Barcode(dataElements: [], issuerIdentificationNumber: "1", AAMVAVersionNumber: "1", jurisdictionVersionNumber: "1")

        super.init()
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Document Window Controller")) as! WindowController
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
       
        return barcode.data
    }

    override func read(from data: Data, ofType typeName: String) throws {
        if let barcode = NSKeyedUnarchiver.unarchiveObject(with: data) as? Barcode {
            self.barcode = barcode
        }
    }
}

