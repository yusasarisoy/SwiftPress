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

  // MARK: - isEmoji

  func test_whenCheckWhetherEmojiCharacterIsEmoji_thenItShouldBeTrue() {
    // Given
    let emojiCharacter: Character = "😀"

    // When
    let isCharacterEmoji = emojiCharacter.isEmoji

    // Then
    XCTAssertTrue(isCharacterEmoji, "Emoji character should be recognized as an emoji.")
  }

  func test_whenCheckWhetherNonEmojiCharacterIsEmoji_thenItShouldBeFalse() {
    // Given
    let nonEmojiCharacter: Character = "A"

    // When
    let isCharacterEmoji = nonEmojiCharacter.isEmoji

    // Then
    XCTAssertFalse(isCharacterEmoji, "Non-emoji character should not be recognized as an emoji.")
  }
}
