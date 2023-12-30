import Foundation

public extension Data {
  /// Decodes the JSON data into the specified `Decodable` type.
  ///
  /// - Parameter type: The type to decode the JSON data into. Must conform to `Decodable`.
  /// - Returns: An instance of the specified type decoded from the JSON data, or `nil` if decoding fails.
  ///
  /// Example:
  ///
  /// ```swift
  /// let jsonData = // Your JSON data for User
  /// if let user: User = jsonData.decodeJSON() {
  ///   print(user)
  /// } else {
  ///   print("Failed to decode JSON")
  /// }
  /// ```
  ///
  /// - Note: Ensure that the specified type conforms to the `Decodable` protocol.
  ///
  func decodeJSON<Element: Decodable>() -> Element? {
    let decoder = JSONDecoder()
    do {
      return try decoder.decode(Element.self, from: self)
    } catch {
      print("Failed to decode JSON: \(error)")
      return nil
    }
  }

  /// Converts the contents of the data to a hexadecimal string representation.
  ///
  /// - Returns: A hexadecimal string representation of the data.
  ///
  /// - Note: Each byte in the data is represented by two hexadecimal characters.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let data = "Hello, World!".data(using: .utf8)
  /// let hexString = data?.toHexString()
  /// print(hexString) // Output: 48656c6c6f2c20576f726c6421
  /// ```
  ///
  func toHexString() -> String {
    map { String(format: "%02hhx", $0) }.joined()
  }
}
