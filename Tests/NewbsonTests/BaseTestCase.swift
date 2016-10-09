import XCTest

class BaseTestCase: XCTestCase {
    func workingDir() -> String? {
        let parts = #file.components(separatedBy: "/Tests/NewbsonTests")
        guard parts.count == 2 else {
            return nil
        }

        return parts.first
    }
}
