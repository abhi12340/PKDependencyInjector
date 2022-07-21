import XCTest
@testable import PKDependencyInjector

final class PKDependencyInjectorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(PKDependencyInjector.sharedInstance)
    }
}
