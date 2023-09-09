import XCTest
@testable import SwiftPress

final class StringTests: XCTestCase {
  
  // MARK: - Test Setup
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Tests
  
  // MARK: - empty
  
  func test_staticEmptyProperty_expectToReturnsEmptyString() {
    // Given
    let expectedEmptyString: String = ""

    // When
    let emptyString = String.empty

    // Then
    XCTAssertEqual(emptyString, expectedEmptyString)
  }

  func test_staticEmptyProperty_expectToNotEqualToNonEmptyString() {
    // Given
    let nonEmptyString: String = "Hello, world!"

    // When
    let emptyString = String.empty

    // Then
    XCTAssertNotEqual(emptyString, nonEmptyString)
  }
}
