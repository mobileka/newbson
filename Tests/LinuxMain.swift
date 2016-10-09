#if os(Linux)

import XCTest
@testable import NewbsonTests

XCTMain([
     testCase(NewbsonTests.allTests),
])

#endif