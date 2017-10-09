import Foundation

class DataElement<T>: NSCoding {
    let data: T
    
    init(_ data: T) {
        self.data = data
    }
    
    required init(coder aDecoder: NSCoder) {
        data = aDecoder.decodeData() as! T
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(data)
    }
}
