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
}
