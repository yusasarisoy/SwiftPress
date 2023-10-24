import XCTest

final class ArrayTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - firstIndex(of:)

  func test_whenFindingFirstIndex_expectTheIndexIsTwo() {
    // Given
    let numbers = [10, 20, 30, 40, 30, 50]

    // When
    if let index = numbers.firstIndex(of: 30) {
      // Then
      XCTAssertEqual(index, 2)
    } else {
      XCTFail("Index not found")
    }
  }

  func test_whenElementNotFound_expectTheIndexIsNil() {
    // Given
    let numbers = [10, 20, 30, 40, 50]

    // When
    let index = numbers.firstIndex(of: 60)

    // Then
    XCTAssertNil(index)
  }

  func test_whenFindIndexInAnEmptyArray_expectTheIndexIsNil() {
    // Given
    let emptyArray = [Int]()

    // When
    let index = emptyArray.firstIndex(of: 10)

    // Then
    XCTAssertNil(index)
  }

  // MARK: - subscript(safe:)

  func test_givenNonEmptyArrayWhenAccessingValidIndex_thenReturnsCorrectElement() {
    // Given
    let array = [
      "apple", 
      "banana",
      "cherry"
    ]

    // When
    let result = array[safe: 1]

    // Then
    XCTAssertEqual(
      result,
      "banana",
      "Accessing a valid index should return the correct element."
    )
  }

  func test_givenNonEmptyArrayWhenAccessingOutOfBoundsIndex_thenReturnsNil() {
    // Given
    let array = [
      "apple",
      "banana",
      "cherry"
    ]

    // When
    let result = array[safe: 3]

    // Then
    XCTAssertNil(
      result,
      "Accessing an out-of-bounds index should return nil."
    )
  }
  
  func test_givenEmptyArrayWhenAccessingAnyIndex_thenReturnsNil() {
    // Given
    let emptyArray: [String] = []

    // When
    let result = emptyArray[safe: 0]

    // Then
    XCTAssertNil(
      result,
      "Accessing an element in an empty array should return nil."
    )
  }
}
