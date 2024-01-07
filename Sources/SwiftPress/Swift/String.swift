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

  /// Truncates the string to a specified length and appends an ellipsis (...) if needed.
  ///
  /// - Parameter length: The maximum length for the truncated string.
  /// - Returns: The truncated string.
  ///
  /// Example:
  ///
  /// ```swift
  /// let longString = "This is a very long string that needs to be truncated."
  /// let truncatedString = longString.truncate(to: 20)
  /// print(truncatedString)
  /// ```
  ///
  func truncate(to length: Int) -> String {
    guard self.count <= length else {
      let index = self.index(self.startIndex, offsetBy: length)
      return "\(String(self[..<index]))..."
    }
    return self
  }

  /// Checks if the string contains only numeric characters.
  ///
  /// - Returns: `true` if the string is numeric; otherwise, `false`.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numericString = "12345"
  /// let nonNumericString = "abc123"
  ///
  /// print(numericString.isNumeric) // Output will be true
  /// print(nonNumericString.isNumeric) // Output will be false
  /// ```
  ///
  var isNumeric: Bool {
    !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted).isNil
  }

  /// Safely converts the string to an integer. Returns `nil` if conversion fails.
  ///
  /// This method attempts to convert the string to an integer using the `Int` initializer.
  /// If the conversion is successful, it returns the resulting integer value.
  /// If the conversion fails, it returns `nil`, preventing potential runtime crashes.
  ///
  /// - Returns: An integer value if conversion is successful, otherwise `nil`.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numericString = "123"
  /// let integerValue = numericString.safeToInt() // Returns Optional(123)
  ///
  /// let nonNumericString = "abc"
  /// let nonNumericValue = nonNumericString.safeToInt() // Returns nil
  /// ```
  ///
  /// - Note: This method uses the `Int` initializer for conversion, and it may return `nil`
  ///   if the string does not represent a valid integer.
  /// - Warning: If the string represents a large integer that exceeds the representable range
  ///   of the `Int` type, the result may be truncated.
  ///
  func safeToInt() -> Int? {
    Int(self)
  }

  /// Capitalizes the first letter of each word in the string.
  ///
  /// - Returns: A new string with the first letter of each word capitalized.
  ///
  /// Example:
  ///
  /// ```swift
  /// let inputString = "hello world"
  /// let capitalizedString = inputString.capitalizeEachWord()
  /// // Result: "Hello World"
  /// ```
  ///
  func capitalizeEachWord() -> String {
    self
      .components(separatedBy: " ")
      .map { $0.prefix(1).capitalized + $0.dropFirst() }
      .joined(separator: " ")
  }

  /// Converts the string into a URL-friendly slug.
  ///
  /// This method replaces spaces with dashes, removes special characters, and converts the string to lowercase.
  ///
  /// - Returns: A URL-friendly slug generated from the string.
  ///
  /// Example:
  ///
  /// ```swift
  /// let title = "Swift Extension Example"
  /// let slug = title.slugify()
  /// print(slug) // Output: "swift-extension-example"
  /// ```
  ///
  func slugify() -> String {
    let slug = replacingOccurrences(of: " ", with: "-")
      .replacingOccurrences(of: "[^a-zA-Z0-9-]", with: String.empty, options: .regularExpression)
    return slug.lowercased()
  }

  /// Counts the occurrences of each character in the string.
  ///
  /// - Returns: A dictionary where keys are characters and values are their occurrences.
  ///
  /// Example:
  ///
  /// ```swift
  /// let text = "hello"
  /// let characterCounts = text.countOccurrences()
  /// print(characterCounts) // Outputs: ["h": 1, "e": 1, "l": 2, "o": 1]
  /// ```
  ///
  func countOccurrences() -> [Character: Int] {
    var occurrences: [Character: Int] = [:]

    for character in self {
      occurrences[character, default: 0] += 1
    }

    return occurrences
  }

  /// Converts the string to a base64-encoded string.
  ///
  /// - Returns: A base64-encoded string representation of the original string.
  ///
  /// Example:
  ///
  /// ```swift
  /// let originalString = "Hello, World!"
  /// let base64String = originalString.toBase64()
  /// print(base64String) // Outputs: "SGVsbG8sIFdvcmxkIQ=="
  /// ```
  ///
  func toBase64() -> String {
    guard let data = self.data(using: .utf8) else {
      return .empty
    }

    return data.base64EncodedString()
  }

  /// An extension for the String class that provides a convenient method for trimming leading and trailing whitespaces and newlines.
  ///
  /// Example:
  ///
  /// ```swift
  /// let exampleString = "   Hello, World!   "
  /// let trimmedString = exampleString.trimWhitespace()
  /// print(trimmedString) // Output: "Hello, World!"
  /// ```
  ///
  /// - Important: This extension uses the `trimmingCharacters(in:)` method of the `String` class to remove leading and trailing whitespaces and newlines. 
  /// It does not modify the original string; instead, it returns a new string with the whitespace trimmed.
  ///
  /// - Returns: A new string with leading and trailing whitespaces and newlines removed.
  /// - Complexity: O(n), where n is the length of the string.
  /// 
  func trimWhitespace() -> String {
    trimmingCharacters(in: .whitespacesAndNewlines)
  }

  /// Checks if the string is a valid IPv4 address.
  ///
  /// This extension method is used to validate whether a given string represents a valid IPv4 address.
  ///
  /// - Returns: `true` if the string is a valid IPv4 address, `false` otherwise.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let ipAddress = "192.168.1.1"
  ///
  /// if ipAddress.isValidIPv4Address() {
  ///   print("Valid IPv4 address.")
  /// } else {
  ///   print("Invalid IPv4 address.")
  /// }
  /// ```
  ///
  /// - Note: The method uses a regular expression pattern to validate the IPv4 address format.
  ///
  /// - Returns: A Boolean value indicating whether the string is a valid IPv4 address.
  ///
  func isValidIPv4Address() -> Bool {
    let regex = #"^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$"#
    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return predicate.evaluate(with: self)
  }

  /// Checks if the string contains a given substring.
  ///
  /// This method determines whether the current string contains the specified substring.
  ///
  /// - Parameters:
  ///   - substring: The substring to check for.
  ///
  /// - Returns: A boolean value indicating whether the string contains the given substring.
  ///
  /// - Complexity: The time complexity of this method is O(n), where n is the length of the string.
  ///
  /// - Note: The comparison is case-sensitive. For case-insensitive comparison, consider using `range(of:options:)` with `.caseInsensitive`.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let originalString = "Hello, World!"
  /// let substringToCheck = "World"
  ///
  /// if originalString.contains(substring: substringToCheck) {
  ///   print("String contains the substring.")
  /// } else {
  ///   print("String does not contain the substring.")
  /// }
  /// ```
  ///
  /// This will print whether the original string contains the specified substring or not.
  ///
  func contains(substring: String) -> Bool {
    range(of: substring) != nil
  }

  /// Converts a snake_case string to CamelCase.
  ///
  /// This method takes a string in snake_case format and transforms it into CamelCase.
  ///
  /// - Returns: A new string in CamelCase.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let snakeCaseString = "hello_world_swift"
  /// let camelCaseString = snakeCaseString.snakeCaseToCamelCase()
  /// print(camelCaseString) // Output: "HelloWorldSwift"
  /// ```
  ///
  func snakeCaseToCamelCase() -> String {
    let components = self.components(separatedBy: "_")
    let camelCaseComponents = components.map { $0.capitalized }
    return camelCaseComponents.joined()
  }

  /// Converts a camel-case string to snake case.
  ///
  /// ## Example
  ///
  /// ```swift
  /// // Example Usage:
  /// let camelCaseString = "myVariableName"
  /// let snakeCaseString = camelCaseString.camelToSnakeCase()
  /// print(snakeCaseString)
  /// ```
  ///
  /// - Returns: The snake case representation of the string.
  ///
  func camelToSnakeCase() -> String {
    guard let regex = try? NSRegularExpression(pattern: "([a-z])([A-Z])") else {
      return .empty
    }
    let range = NSRange(startIndex..<endIndex, in: self)
    return regex.stringByReplacingMatches(in: self, range: range, withTemplate: "$1_$2").lowercased()
  }

  /// Checks if a string is empty or consists only of whitespaces.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let emptyString = ""
  /// let whitespaceString = "    "
  /// let nonEmptyString = "Hello, World!"
  ///
  /// print(emptyString.isBlank) // Output: true
  /// print(whitespaceString.isBlank) // Output: true
  /// print(nonEmptyString.isBlank) // Output: false
  /// ```
  ///
  /// - Returns: `true` if the string is empty or contains only whitespaces, `false` otherwise.
  ///
  var isBlank: Bool {
    allSatisfy { $0.isWhitespace }
  }

  /// Converts a string to a boolean value.
  ///
  /// The conversion is case-insensitive, and the string is considered `true` only if it exactly matches "true".
  ///
  /// ## Example
  ///
  /// ```swift
  /// let trueString = "true"
  /// let falseString = "false"
  /// let isTrue = trueString.boolValue // true
  /// let isFalse = falseString.boolValue // false
  /// ```
  ///
  /// - Returns: `true` if the string is "true"; otherwise, `false`.
  ///
  var boolValue: Bool {
    lowercased() == "true"
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
