import XCTest
@testable import Newbson

class NewbsonTests: BaseTestCase {
    func testInitialization() throws {
        let _ = Newbson(path: "String!")
    }

    func testReturnsFileContents() throws {
        let path = workingDir()! + "/Tests/NewbsonTests/resources/simple.json"
        let newbson = Newbson(path: path)
        let expect = "{\"key\": \"value\"}"

        let result = try newbson.getContents()

        XCTAssertEqual(expect, result)
    }

    func testReturnsBytes() throws {
        let path = workingDir()! + "/Tests/NewbsonTests/resources/simple.json"
        let newbson = Newbson(path: path)
        let expect = [UInt8]("{\"key\": \"value\"}".utf8)

        let result = try newbson.getBytes()

        XCTAssertEqual(expect, result)
    }

    func testReturnsData() throws {
        let path = workingDir()! + "/Tests/NewbsonTests/resources/simple.json"
        let newbson = Newbson(path: path)
        let expect = Data(bytes: [UInt8]("{\"key\": \"value\"}".utf8))

        let result = try newbson.getData()

        XCTAssertEqual(expect, result)
    }


    func testReads() throws {
        let path = workingDir()! + "/Tests/NewbsonTests/resources/simple.json"
        let newbson = Newbson(path: path)
        let expect = ["key" : "value"]

        let result = try newbson.read() as! [String : String]

        XCTAssertEqual(expect, result)
    }

    static var allTests : [(String, (NewbsonTests) -> () throws -> Void)] {
        return [
            ("testInitialization", testInitialization),
            ("testReturnsFileContents", testReturnsFileContents),
            ("testReturnsBytes", testReturnsBytes),
            ("testReturnsData", testReturnsData),
            ("testReads", testReads),
        ]
    }
}
