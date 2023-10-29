import XCTest

final class CollectionTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - contains(_:)

  func test_whenContainsElementInArray_expectThreeIsInTheArray() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let containsThree = numbers.contains(3)

    // Then
    XCTAssertTrue(containsThree, "Array should contain element 3.")
  }

  func test_whenContainsElementNotInArray_expectTenIsNotInTheArray() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let containsTen = numbers.contains(10)

    // Then
    XCTAssertFalse(containsTen, "Array should not contain element 10.")
  }

  func test_whenArrayIsEmpty_expectOneIsNotInTheArray() {
    // Given
    let emptyArray: [Int] = []

    // When
    let containsOne = emptyArray.contains(1)

    // Then
    XCTAssertFalse(containsOne, "Empty array should not contain any elements")
  }

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
