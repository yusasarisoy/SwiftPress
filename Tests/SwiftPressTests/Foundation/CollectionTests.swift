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

  func test_whenFilteringAndTransformingGivenArrayWithElements_thenTransformedValuesReturned() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let squaredEvenNumbers = numbers.filterAndTransform(
      condition: { $0 % 2 == 0 },
      transform: { $0 * $0 }
    )

    // Then
    XCTAssertEqual(squaredEvenNumbers, [4, 16])
  }

  func test_whenFilteringAndTransformingGivenEmptyArray_thenEmptyArrayReturned() {
    // Given
    let emptyArray = [Int]()

    // When
    let transformedValues = emptyArray.filterAndTransform(
      condition: { $0 % 2 == 0 }, 
      transform: { $0 * $0 }
    )

    // Then
    XCTAssertTrue(transformedValues.isEmpty)
  }

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

  // MARK: - difference(from:)

  func test_whenFindingDifferenceBetweenTwoArrays_shouldReturnElementsUniqueToFirstCollection() {
    // Given
    let collection1 = [1, 2, 3, 4, 5]
    let collection2 = [3, 4, 5, 6, 7]

    // When
    let difference = collection1.difference(from: collection2)

    // Then
    XCTAssertEqual(difference, [1, 2], "Difference calculation is incorrect")
  }
}
