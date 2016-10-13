import XCTest
@testable import Newbson

class NewbsonTests: BaseTestCase {
    func testInitialization() throws {
        let _ = Newbson(path: "String!")
    }

    func testReturnsData() {
        let path = workingDir()! + "/Tests/NewbsonTests/resources/simple.json"
        let newbson = Newbson(path: path)
        let expect = Data(bytes: [UInt8]("{\"key\": \"value\"}".utf8))

        let result = newbson.getData()

        XCTAssertEqual(expect, result)
    }

    func testGetDataReturnsNil() {
        let path = workingDir()! + "wrong/path"
        let newbson = Newbson(path: path)

        if let _ = newbson.getData() {
            XCTFail("The result is expected to be nil")
        }
    }

    func testReads() throws {
        let path = workingDir()! + "/Tests/NewbsonTests/resources/simple.json"
        let newbson = Newbson(path: path)
        let expect = ["key" : "value"]

        let result = try newbson.read() as! [String : String]

        XCTAssertEqual(expect, result)
    }

    func testReadThrowsException() throws {
        let path = workingDir()! + "wrong/path"
        let newbson = Newbson(path: path)

        do {
            let _ = try newbson.read()
            XCTFail("`read` method should throw an error")
        } catch let e as NewbsonError {
            XCTAssertEqual(e, NewbsonError.fileNotFound(path: path))
        } catch {
            XCTFail("`read` method throws a wrong error")
        }
    }

    static var allTests : [(String, (NewbsonTests) -> () throws -> Void)] {
        return [
            ("testInitialization", testInitialization),
            ("testReturnsData", testReturnsData),
            ("testGetDataReturnsNil", testGetDataReturnsNil),
            ("testReads", testReads),
            ("testReadThrowsException", testReadThrowsException),
        ]
    }
}
