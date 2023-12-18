import XCTest

final class DictionaryTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - customFilter(_:)

  func test_whenFilterPredicateIncludesPairs_thenReturnsFilteredDictionary() throws {
    // Given
    let scores = ["Alice": 85, "Bob": 92, "Charlie": 78, "David": 95]

    // When
    let passingScores = scores.customFilter { $0.value >= 90 }

    // Then
    XCTAssertEqual(passingScores, ["Bob": 92, "David": 95], "Should return a filtered dictionary based on the predicate")
  }

  func test_whenFilterPredicateExcludesPairs_thenReturnsFilteredDictionary() throws {
    // Given
    let scores = ["Alice": 85, "Bob": 92, "Charlie": 78, "David": 95]

    // When
    let failingScores = scores.customFilter { $0.value < 90 }

    // Then
    XCTAssertEqual(failingScores, ["Alice": 85, "Charlie": 78], "Should return a filtered dictionary based on the predicate")
  }

  func test_whenFilterEmptyDictionary_thenReturnsEmptyDictionary() throws {
    // Given
    let emptyDictionary: [String: Int] = [:]

    // When
    let result = emptyDictionary.customFilter { $0.value >= 90 }

    // Then
    XCTAssertTrue(result.isEmpty, "Should return an empty dictionary for an empty input")
  }

  // MARK: - merge(_:)

  func test_whenMergingInPlaceGivenTwoDictionaries_thenValuesAreOverwritten() {
    // Given
    var firstDictionary = ["a": 1, "b": 2]
    let secondDictionary = ["b": 3, "c": 4]

    // When
    firstDictionary.merge(secondDictionary)

    // Then
    XCTAssertEqual(firstDictionary["a"], 1)
    XCTAssertEqual(firstDictionary["b"], 3)  // Overwritten by the second dictionary
    XCTAssertEqual(firstDictionary["c"], 4)
  }
}
