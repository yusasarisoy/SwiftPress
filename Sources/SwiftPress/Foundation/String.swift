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
}

// MARK: - RawRepresentable

public extension RawRepresentable where Self: RawRepresentable, RawValue == String {
  /// Retrieves the localized string for the enum case's raw value.
  ///
  /// This property assumes that the raw value of the enum case corresponds to a key in the Localizable.strings file
  /// and retrieves the localized string using `NSLocalizedString`.
  ///
  /// Example:
  /// ```
  /// let localizedSearch = Localizable.search.rawLocalizedString
  /// // localizedSearch will contain the localized string corresponding to the "search" key.
  /// ```
  ///
  /// - Note: Make sure that the string value is defined as a key in the Localizable.strings file for localization to work correctly.
  ///
  /// - Returns: The localized string for the enum case's raw value.
  var rawLocalizedString: String {
    NSLocalizedString(rawValue, comment: .empty)
  }

  /// Retrieves a localized string for an enum case with a format string and a placeholder.
  ///
  /// This function is designed for enumerations that have raw values with format strings containing placeholders.
  /// It retrieves the localized string for the enum case's raw value, replacing the placeholder with the provided parameter.
  ///
  /// Example:
  ///
  /// ```
  /// let localizedTitle = Localizable.yourKey.rawLocalizedString(with: "Your String")
  /// ```
  ///
  /// - Parameter parameter: The value to insert into the format string placeholder.
  /// - Returns: The localized string with the parameter inserted.
  ///
  func rawLocalizedString(with parameter: String) -> String {
    String(format: NSLocalizedString(rawValue, comment: ""), parameter)
  }
}
