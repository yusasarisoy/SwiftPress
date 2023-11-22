import Foundation

extension URL: ExpressibleByStringLiteral {
  /// Creates a URL instance from a string literal.
  ///
  /// This initializer allows direct assignment of a string literal to a `URL`.
  /// It attempts to create a URL from the provided string. If the string is not a
  /// valid URL, the initializer returns `nil`.
  ///
  /// - Parameter stringLiteral: The string literal representing a URL.
  ///
  /// Example:
  ///
  /// ```swift
  /// let appleURL: URL? = "www.apple.com"
  /// ```
  ///
  public init(stringLiteral value: String) {
    self = URL(string: value)!
  }
}
