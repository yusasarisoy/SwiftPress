import XCTest

final class CharacterTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - isVowel

  func test_whenCheckWhetherGivenVowelAndNonVowelCharactersAreVowel_thenReturnsCorrectResult() {
    // Given
    let vowelChar: Character = "a"
    let nonVowelChar: Character = "b"

    // When
    let isVowel1 = vowelChar.isVowel
    let isVowel2 = nonVowelChar.isVowel

    // Then
    XCTAssertTrue(isVowel1, "Should return true for a vowel character")
    XCTAssertFalse(isVowel2, "Should return false for a non-vowel character")
  }
}

