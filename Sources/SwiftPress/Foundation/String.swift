/// An extension on the `String` type providing utility methods.
public extension String {
  /// Represents an empty string.
  ///
  /// This static property can be used to conveniently represent an empty string.
  ///
  /// Example:
  /// ```
  /// let emptyString = String.empty
  /// ```
  static var empty: String {
    ""
  }

  /// Clears the content of the string, setting it to an empty string.
  ///
  /// Example:
  /// ```
  /// var myText = "This is some text."
  /// myText.clear()
  /// print("Cleared text: \(myText)") // Output: Cleared text:
  /// ```
  mutating func clear() {
    self = .empty
  }

  /// Removes all whitespace and new line characters from the string.
  /// - Returns: A new string with all whitespace and new line characters removed.
  ///
  ///
  /// Example:
  /// ```
  /// let inputString = "   Hello, \nWorld!   "
  /// let result = inputString.removeWhitespaceAndNewLines()
  /// // Result: "Hello,World!"
  /// ```
  func removeWhitespaceAndNewLines() -> String {
    replacingOccurrences(of: " ", with: String.empty).replacingOccurrences(of: "\n", with: String.empty)
  }
}
