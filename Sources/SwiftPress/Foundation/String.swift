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

  /// Localizes a string using the NSLocalizedString function.
  ///
  /// This computed property allows any String to be easily localized using the NSLocalizedString function.
  /// It uses the string itself as the localization key, assuming that the key is defined in the Localizable.strings file.
  ///
  /// Example usage:
  /// ```
  /// let localizedGreeting = "hello_world".localized
  /// // localizedGreeting will contain the localized version of "Hello, World!" based on the device's language settings.
  /// ```
  ///
  /// - Note: Make sure that the string value is defined as a key in the Localizable.strings file for localization to work correctly.
  ///
  /// - Returns: The localized version of the string.
  var localized: String {
    NSLocalizedString(self, comment: .empty)
  }

  /// Localizes the string using NSLocalizedString with support for placeholders.
  ///
  /// This method retrieves the localized version of the string using the provided key, and if placeholders
  /// are included in the localized string, it replaces them with the provided arguments.
  ///
  /// Example:
  ///
  /// ```
  /// let username = "John"
  /// let numberOfApples = 5
  /// let localizedString = "welcome_message".localizedWithFormat(username, numberOfApples)
  /// // localizedString will contain "Welcome, John! You have 5 apples."
  /// ```
  ///
  /// - Parameters:
  ///   - arguments: A variable number of arguments to replace placeholders in the localized string.
  ///   - comment: An optional comment to describe the purpose of the localized string.
  ///
  /// - Returns: The localized string with placeholders replaced by the provided arguments (if any).
  ///
  func localizedWithFormat(
    _ arguments: CVarArg...,
    comment: String = ""
  ) -> String {
    let localizedString = NSLocalizedString(
      self,
      comment: comment
    )

    return String(
      format: localizedString,
      arguments: arguments
    )
  }
}

// MARK: - RawRepresentable

public extension RawRepresentable where Self: RawRepresentable, RawValue == String {
  /// Retrieves the localized string for the enum case's raw value.
  ///
  /// This property assumes that the raw value of the enum case corresponds to a key in the Localizable.strings file
  /// and retrieves the localized string using `NSLocalizedString`.
  ///
  /// Example usage:
  /// ```
  /// let localizedSearch = Localizable.search.rawLocalizedString
  /// // localizedSearch will contain the localized string corresponding to the "search" key.
  /// ```
  ///
  /// - Note: Make sure that the string value is defined as a key in the Localizable.strings file for localization to work correctly.
  ///
  /// - Returns: The localized string for the enum case's raw value.
  var rawLocalizedString: String {
    return NSLocalizedString(rawValue, comment: .empty)
  }
}
