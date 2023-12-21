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

  // MARK: - value(for:default:)

  func test_whenRetrievingValueGivenExistingKey_thenReturnCorrectScore() {
    // Given
    let scores = ["Alice": 90, "Bob": 85, "Charlie": 95]

    // When
    let aliceScore = scores.value(for: "Alice", default: 0)

    // Then
    XCTAssertEqual(aliceScore, 90, "Expected to get Alice's score of 90")
  }

  func test_whenRetrievingValueGivenNonExistingKey_thenReturnDefaultValue() {
    // Given
    let scores = ["Alice": 90, "Bob": 85, "Charlie": 95]

    // When
    let davidScore = scores.value(for: "David", default: 0)

    // Then
    XCTAssertEqual(davidScore, 0, "Expected to get the default score of 0 for David")
  }

  func test_whenRetrievingValueGivenExistingKeyWithoutUsingDefaultValue_thenReturnCorrectScore() {
    // Given
    let scores = ["Alice": 90, "Bob": 85, "Charlie": 95]

    // When
    let charlieScore = scores.value(for: "Charlie", default: 0)

    // Then
    XCTAssertEqual(charlieScore, 95, "Expected to get Charlie's score of 95 without using the default value")
  }
}
