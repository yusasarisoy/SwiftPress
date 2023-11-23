import XCTest

final class SequenceTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - filterNils()

  func test_whenFilteringNilsOfGivenOptionals_rhenFilteredArrayShouldNotContainNils() {
    // Given
    let optionalNumbers: [Int?] = [1, 2, nil, 4, nil, 6]

    // When
    let nonOptionalNumbers = optionalNumbers.filterNils()

    // Then
    XCTAssertEqual(nonOptionalNumbers, [1, 2, 4, 6], "Filtering nils should result in an array without nils.")
  }

  func test_whenFilteringNilsOfGivenEmptyArray_thenResultShouldBeEmptyArray() {
    // Given
    let emptyArray: [Int?] = []

    // When
    let result = emptyArray.filterNils()

    // Then
    XCTAssertEqual(result, [], "Filtering nils from an empty array should result in an empty array.")
  }
}
