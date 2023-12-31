public extension Character {
  /// Checks if the character is a vowel.
  ///
  /// - Returns: `true` if the character is a vowel, `false` otherwise.
  ///
  /// Example:
  ///
  /// ```swift
  /// let char1: Character = "a"
  /// let char2: Character = "b"
  /// print(char1.isVowel) // Outputs: true
  /// print(char2.isVowel) // Outputs: false
  /// ```
  ///
  var isVowel: Bool {
    ["a", "e", "i", "o", "u"].contains(lowercased())
  }

  /// Checks if the character is an emoji.
  ///
  /// A character is considered an emoji if its Unicode scalar has the `isEmoji` property set to true.
  ///
  /// - Returns: A boolean value indicating whether the character is an emoji.
  ///
  /// ## Example
  ///
  /// ``` swift
  /// let emojiCharacter: Character = "😀"
  /// let nonEmojiCharacter: Character = "A"
  ///
  /// print("\(emojiCharacter) is emoji: \(emojiCharacter.isEmoji)") // Output: 😀 is emoji: true
  /// print("\(nonEmojiCharacter) is emoji: \(nonEmojiCharacter.isEmoji)") // Output: A is emoji: false
  /// ```
  ///
  var isEmoji: Bool {
    unicodeScalars.first?.properties.isEmoji ?? false
  }
}
