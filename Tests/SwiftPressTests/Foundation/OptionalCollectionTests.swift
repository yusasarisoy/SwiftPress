import XCTest

final class OptionalCollectionTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - isNilOrEmpty

  func test_emptyArray_expectTheArrayIsNilOrEmpty() {
    // Given
    let emptyArray: [Int]? = []

    // When, Then
    XCTAssertTrue(emptyArray.isNilOrEmpty)
  }

  func test_NonEmptyArray_expectTheArrayIsNotNilOrEmpty() {
    // Given
    let nonEmptyArray: [String]? = ["apple", "banana"]

    // When, Then
    XCTAssertFalse(nonEmptyArray.isNilOrEmpty)
  }

  func test_nilArray_expectTheArrayIsNilOrEmpty() {
    // Given
    let nilArray: [Double]? = nil

    // When, Then
    XCTAssertTrue(nilArray.isNilOrEmpty)
  }
}
