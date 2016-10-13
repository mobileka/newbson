import Foundation

public class Newbson {
    public let path: String
    
    public init(path: String) {
        self.path = path
    }

    public func getData() -> Data? {
        guard let fh = FileHandle(forReadingAtPath: path) else {
            return nil
        }

        return fh.readDataToEndOfFile()
    }

    public func read() throws -> Any? {
        guard let data = getData() else {
            throw NewbsonError.fileNotFound(path: path)
        }
        
        return try JSONSerialization.jsonObject(with: data)
    }
}
