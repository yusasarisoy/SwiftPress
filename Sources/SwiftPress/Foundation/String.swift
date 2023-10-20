import Foundation

/// An extension on the `String` type providing utility methods.
public extension String {
  /// Represents an empty string.
  ///
  /// This static property can be used to conveniently represent an empty string.
  ///
  /// Example:
  ///
  /// ```swift
  /// let emptyString = String.empty
  /// ```
  ///
  static var empty: String {
    ""
  }

  /// Clears the content of the string, setting it to an empty string.
  ///
  /// Example:
  ///
  /// ```swift
  /// var myText = "This is some text."
  /// myText.clear()
  /// print("Cleared text: \(myText)") // Output: Cleared text:
  /// ```
  ///
  mutating func clear() {
    self = .empty
  }

  /// Removes all whitespace and new line characters from the string.
  /// - Returns: A new string with all whitespace and new line characters removed.
  ///
  ///
  /// Example:
  ///
  /// ```swift
  /// let inputString = "   Hello, \nWorld!   "
  /// let result = inputString.removeWhitespaceAndNewLines()
  /// // Result: "Hello,World!"
  /// ```
  ///
  func removeWhitespaceAndNewLines() -> String {
    replacingOccurrences(of: " ", with: String.empty).replacingOccurrences(of: "\n", with: String.empty)
  }

  /// Check if the string is a valid email address.
  ///
  /// This extension method is used to validate whether a given string represents a valid email address.
  ///
  /// - Returns: `true` if the string is a valid email address, `false` otherwise.
  ///
  /// Example:
  ///
  /// ```swift
  /// let emailAddress = "user@example.com"
  ///
  /// if emailAddress.isValidEmail() {
  ///   print("Valid email address.")
  /// } else {
  ///   print("Invalid email address.")
  /// }
  /// ```
  ///
  /// - Note: The regular expression used for email validation checks for common email address formats, such as "user@example.com."
  ///
  /// - Returns: A Boolean value indicating whether the string is a valid email address.
  ///
  func isValidEmail() -> Bool {
    // Regular expression pattern for validating email addresses.
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

    // Create an NSPredicate using the email regex pattern.
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

    // Evaluate the predicate with the string as 'SELF' and return the result.
    return emailPredicate.evaluate(with: self)
  }

  /// Convert the string to a URL.
  ///
  /// This extension method is used to attempt to create a `URL` instance from a given string. 
  /// It is particularly useful for checking if a string represents a valid URL and creating a `URL` for further usage.
  ///
  /// - Returns: A `URL` instance created from the string, or `nil` if the string is not a valid URL.
  ///
  /// - Example:
  ///
  /// ```swift
  /// let urlString = "https://www.apple.com"
  ///
  /// guard let url = urlString.toURL() else {
  ///   print("Invalid URL..")
  /// }
  ///
  /// print("Valid URL: \(url).")
  /// ```
  ///
  /// - Note: The method uses `URL(string:)` to create a `URL` instance from the string. If the string does not conform to a valid URL format, it will return `nil`.
  ///
  func toURL() -> URL? {
    URL(string: self)
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
  ///
  /// ```swift
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
  /// ```swift
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
