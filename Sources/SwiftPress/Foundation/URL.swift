import Foundation

public extension URL {
  /// Appends query parameters to the URL.
  ///
  /// This method takes a dictionary of key-value pairs representing query parameters and appends them to the existing URL.
  ///
  /// - Parameter parameters: A dictionary containing the query parameters.
  ///   - Each key-value pair in the dictionary corresponds to a query parameter, where the key is the parameter name, and the value is its associated value.
  ///
  /// - Returns: A new URL with the appended query parameters.
  ///   - If the URL or the provided parameters are invalid, the method returns `nil`.
  ///
  /// Example:
  ///
  /// ```swift
  /// let baseURL = URL(string: "https://example.com")!
  /// let parameters = ["key1": "value1", "key2": "value2"]
  /// let resultURL = baseURL.appendingQueryParameters(parameters)
  /// print(resultURL?.absoluteString) 
  /// // Output: "https://example.com?key1=value1&key2=value2" or "https://example.com?key2=value2&key1=value1"
  /// ```
  ///
  /// - Note: This method is designed to work with URLs that may or may not have existing query parameters.
  ///   - If the URL already contains query parameters, the new parameters will be appended to the existing ones.
  ///   - If the URL or parameters are invalid, the method returns `nil`.
  ///
  func appendingQueryParameters(_ parameters: [String: String]) -> URL? {
    guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
      return nil
    }

    var queryItems = components.queryItems.or([])
    queryItems += parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    components.queryItems = queryItems

    return components.url
  }
}

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
