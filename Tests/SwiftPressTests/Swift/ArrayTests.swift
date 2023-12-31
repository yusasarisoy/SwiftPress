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

  // MARK: - removingDuplicates()

  func test_whenRemovingDuplicatesFromGivenArrayWithDuplicates_thenUniqueArray() {
    // Given
    let arrayWithDuplicates = [1, 2, 2, 3, 4, 4, 5]

    // When
    let uniqueArray = arrayWithDuplicates.removingDuplicates()

    // Then
    XCTAssertEqual(uniqueArray, [1, 2, 3, 4, 5], "The array should have duplicates removed.")
  }

  func test_whenRemovingDuplicatesFromGivenEmptyArray_thenEmptyArray() {
    // Given
    let emptyArray: [Int] = []

    // When
    let uniqueArray = emptyArray.removingDuplicates()

    // Then
    XCTAssertEqual(uniqueArray, [], "The result should be an empty array.")
  }

  func test_whenRemovingDuplicatesFromGivenArrayWithObjects_thenUniqueArray() {
    // Given
    struct CustomObject: Hashable {
      let id: Int
    }

    let array = [
      CustomObject(id: 1), 
      CustomObject(id: 2), 
      CustomObject(id: 1),
      CustomObject(id: 3)
    ]

    // When
    let uniqueArray = array.removingDuplicates()

    // Then
    XCTAssertEqual(uniqueArray.count, 3, "The array should have duplicates removed.")
  }

  // MARK: - chunked(into:)

  func test_whenChunkedGivenArrayWithElementsWithValidSize_thenChunksCreated() {
    // Given
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    // When
    let chunks = numbers.chunked(into: 3)
  
    // Then
    XCTAssertEqual(chunks.count, 3)
    XCTAssertEqual(chunks[0], [1, 2, 3])
    XCTAssertEqual(chunks[1], [4, 5, 6])
    XCTAssertEqual(chunks[2], [7, 8, 9])
  }

  func testwhenChunkedGivenEmptyArray_thenEmptyChunksCreated() {
    // Given
    let emptyArray = [Int]()

    // When
    let chunks = emptyArray.chunked(into: 3)

    // Then
    XCTAssertTrue(chunks.isEmpty)
  }

  func test_whenChunkedGivenArrayWithElementsWithUnevenSize_thenUnevenChunksCreated() {
    // Given
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8]

    // When
    let chunks = numbers.chunked(into: 3)

    // Then
    XCTAssertEqual(chunks.count, 3)
    XCTAssertEqual(chunks[0], [1, 2, 3])
    XCTAssertEqual(chunks[1], [4, 5, 6])
    XCTAssertEqual(chunks[2], [7, 8])
  }

  // MARK: - mostFrequent()

  func test_whenFindingMostFrequentOfGivenArrayWithFrequencies_thenShouldReturnMostFrequentElement() {
    // Given
    let array = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

    // When
    let mostFrequent = array.mostFrequent()

    // Then
    XCTAssertEqual(mostFrequent, 4, "The most frequent element in the array is 4.")
  }

  func test_whenFindingMostFrequentOfGivenEmptyArray_thenShouldReturnNil() {
    // Given
    let emptyArray: [Int] = []

    // When
    let mostFrequent = emptyArray.mostFrequent()

    // Then
    XCTAssertNil(mostFrequent, "The array is empty, so there is no most frequent element.")
  }

  func test_whenFindingMostFrequentOfGivenArrayWithSingleElement_thenShouldReturnThatElement() {
    // Given
    let array = [42]

    // When
    let mostFrequent = array.mostFrequent()

    // Then
    XCTAssertEqual(mostFrequent, 42, "The array has only one element, so it is the most frequent.")
  }

  // MARK: - slice(from:to:)

  func test_WhenSliceGivenEmptyArray_thenSlicingReturnsEmptyArray() {
    // Given
    let emptyArray = [Int]()

    // When
    let slicedArray = emptyArray.slice(from: 0, to: 1)

    // Then
    XCTAssertNil(slicedArray)
  }
  
  func test_WhenSliceGivenArrayWithSingleElement_thenSlicingReturnsSingleElementArray() {
    // Given
    let array = [1, 2, 3]

    // When
    let slicedArray = array.slice(from: 0, to: 1)

    // Then
    XCTAssertEqual(slicedArray, [1])
  }
  
  func test_WhenSliceGivenArrayWithMultipleElements_thenSlicingMultipleElementsReturnsDesiredSlice() {
    // Given
    let array = [1, 2, 3]

    // When
    let slicedArray = array.slice(from: 1, to: 2)

    // Then
    XCTAssertEqual(slicedArray, [2])
  }
  
  func test_WhenSliceGivenArrayWithSliceOutOfRange_thenSlicingReturnsEmptyArray() {
    // Given
    let array = [1, 2, 3]

    // When
    let slicedArray = array.slice(from: 2, to: 4)

    // Then
    XCTAssertNil(slicedArray)
  }

  // MARK: - groupBy(condition:)

  func test_whenGroupByWithArray_shouldArrayBeFilled() {
    // Given
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    // When
    let groupedByEvenOdd = numbers.groupBy { $0 % 2 == 0 ? "Even" : "Odd" }

    // Then
    XCTAssertEqual(groupedByEvenOdd["Even"], [2, 4, 6, 8, 10])
    XCTAssertEqual(groupedByEvenOdd["Odd"], [1, 3, 5, 7, 9])
  }

  func test_whenGroupByWithEmptyArray_shouldArrayBeEmpty() {
    // Given
    let emptyArray: [Int] = []

    // When
    let grouped = emptyArray.groupBy { $0 % 2 == 0 ? "Even" : "Odd" }

    // Then
    XCTAssertTrue(grouped.isEmpty)
  }

  // MARK: - rotateLeft(by:)

  func test_whenRotateLeftAnArray_shouldRotateArrayToLeftBySpecifiedPositions() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let rotatedByTwo = numbers.rotateLeft(by: 2)

    // Then
    XCTAssertEqual(rotatedByTwo, [3, 4, 5, 1, 2])
  }

  func test_whenRotateLeftAnEmptyArray_shouldReturnEmptyArray() {
    // Given
    let emptyArray: [Int] = []

    // When
    let rotated = emptyArray.rotateLeft(by: 3)

    // Then
    XCTAssertEqual(rotated, [])
  }

  func test_whenRotateLeftAnArrayWithZeroPositions_shouldReturnOriginalArray() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let rotatedByZero =  numbers.rotateLeft(by: 0)

    // Then
    XCTAssertEqual(rotatedByZero, numbers)
  }

  func test_whenRotateLeftAnArrayWithNegativePositions_shouldRotateArrayToLeftBySpecifiedNegativePositions() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let rotatedByNegative = numbers.rotateLeft(by: -2)

    // Then
    XCTAssertEqual(rotatedByNegative, [4, 5, 1, 2, 3])
  }

  func test_whenRotateLeftAnArrayWithLargeNumberOfPositions_shouldReturnOriginalArray() {
    // Given
    let numbers = [1, 2, 3, 4, 5]

    // When
    let rotatedByLargeNumber = numbers.rotateLeft(by: 100)

    // Then
    XCTAssertEqual(rotatedByLargeNumber, [1, 2, 3, 4, 5])
  }

  // MARK: - intersection(with:)

  func test_whenIntersectionWithCommonElements_shouldReturnIntersection() {
    // Given
    let array1 = [1, 2, 3, 4, 5]
    let array2 = [3, 4, 5, 6, 7]

    // When
    let intersection = array1.intersection(with: array2)

    // Then
    XCTAssertTrue(
      intersection.allSatisfy { element in
        [3, 4, 5].contains(element)
      }
    )
  }

  func testIntersectionWithNoCommonElements_shouldReturnEmptyArray() {
    // Given
    let array1 = [1, 2, 3]
    let array2 = [4, 5, 6]

    // When
    let intersection = array1.intersection(with: array2)

    // Then
    XCTAssertTrue(intersection.isEmpty)
  }

  func test_whenIntersectionWithEmptyArrays_shouldReturnEmptyArray() {
    // Given
    let array1: [Int] = []
    let array2: [Int] = []

    // When
    let intersection = array1.intersection(with: array2)

    // Then
    XCTAssertTrue(intersection.isEmpty)
  }
}
