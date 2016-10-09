import Foundation

public class Newbson {
    public let path: String
    
    public init(path: String) {
        self.path = path
    }
    
    public func getContents() throws -> String {
    	return try String(contentsOfFile: path)
    }

    public func getBytes() throws -> [UInt8] {
    	let contents = try getContents()

    	return [UInt8](contents.utf8)
    }

    public func getData() throws -> Data {
        let bytes = try getBytes()

        return  Data(bytes: bytes)
    }

    public func read() throws -> Any? {
        let data = try getData()
        
        return try JSONSerialization.jsonObject(with: data)
    }
}
