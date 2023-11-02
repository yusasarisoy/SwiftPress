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

  // MARK: - sum()

  func test_whenSumOfIntegers_expectResultIsCorrect() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let sum = numbers.sum()

    // Then
    XCTAssertEqual(sum, 15, "Sum of integers should be 15")
  }

  func test_whenSumOfDoubles_expectResultIsCorrect() {
    // Given
    let numbers = [1.5, 2.5, 3.0, 4.5]

    // When
    let sum = numbers.sum()

    // Then
    XCTAssertEqual(sum, 11.5, "Sum of doubles should be 11.5")
  }

  func test_whenSumOfEmptyArray_expectResultIsZero() {
    // Given
    let emptyArray: [Int] = []

    // When
    let sum = emptyArray.sum()

    // Then
    XCTAssertEqual(sum, 0, "Sum of an empty array should be 0")
  }

  // MARK: - product()

  func test_whenProductOfIntegers_expectResultIsCorrect() {
    // Given
    let integers = [2, 3, 4, 5]

    // Then
    XCTAssertEqual(
      integers.product(),
      2 * 3 * 4 * 5
    )
  }

  func test_whenProductOfDoubles_expectResultAccuracyIsCorrect() {
    // Given
    let doubles = [2.0, 3.5, 1.5]

    // Then
    XCTAssertEqual(
      doubles.product(), 
      2.0 * 3.5 * 1.5,
      accuracy: 0.0001
    )
  }

  // MARK: - isNotEmpty

  func test_whenCheckingEmptyArrayWhetherIsNotEmpty_thenReturnFalse() {
    // Given
    let emptyArray: [Int] = []

    // When
    let result = emptyArray.isNotEmpty

    // Then
    XCTAssertFalse(result)
  }

  func test_whenCheckingNonEmptyArrayWhetherIsNotEmpty_thenReturnTrue() {
    // Given
    let nonEmptyArray: [String] = ["apple", "banana"]

    // When
    let result = nonEmptyArray.isNotEmpty

    // Then
    XCTAssertTrue(result)
  }

  func test_whenCheckingMixedArrayWhetherIsNotEmpty_thenReturnExpectedResults() {
    // Given
    let mixedArray: [String] = ["apple", "banana"]
    let emptyArray: [String] = []
    let arrays: [Array<String>] = [mixedArray, emptyArray]

    // When
    let results = arrays.map { $0.isNotEmpty }

    // Then
    XCTAssertEqual(results, [true, false])
  }
}
