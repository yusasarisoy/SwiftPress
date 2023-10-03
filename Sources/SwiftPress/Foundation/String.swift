import Foundation

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

  /// Localizes the string using NSLocalizedString.
  ///
  /// This method retrieves the localized version of the string using the provided key.
  ///
  /// Example:
  /// ```
  /// let localizedGreeting = "hello_world".localized()
  /// // localizedGreeting will contain the localized string "Hello, World!" based on the device's language settings.
  /// ```
  ///
  /// - Parameter comment: An optional comment to describe the purpose of the localized string.
  /// - Returns: The localized string.
  func localized(comment: String = "") -> String {
    NSLocalizedString(self, comment: comment)
  }
}
