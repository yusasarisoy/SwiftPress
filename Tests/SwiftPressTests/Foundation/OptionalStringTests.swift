import XCTest
@testable import SwiftPress

final class OptionalStringTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - isNilOrEmpty

  func test_nilString_returnsTrue() {
    // Given
    let string: String? = nil

    // When
    let isStringNilOrEmpty = string.isNilOrEmpty

    // Then
    XCTAssertTrue(isStringNilOrEmpty)
  }

  func test_emptyString_returnsTrue() {
    // Given
    let string: String? = ""

    // When
    let isStringNilOrEmpty = string.isNilOrEmpty

    // Then
    XCTAssertTrue(isStringNilOrEmpty)
  }

  func test_nonEmptyString_returnsFalse() {
    // Given
    let string: String? = "Hello, world!"

    // When
    let isStringNilOrEmpty = string.isNilOrEmpty

    // Then
    XCTAssertFalse(isStringNilOrEmpty)
  }

  func test_optionalStringWithValue_returnsFalse() {
    // Given
    let string: String? = "Hello, world!"

    // When
    let isStringNilOrEmpty = string.isNilOrEmpty

    // Then
    XCTAssertFalse(isStringNilOrEmpty)
  }

