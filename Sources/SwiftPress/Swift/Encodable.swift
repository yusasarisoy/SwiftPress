import Foundation

public extension Encodable {
  /// Encodes the given `Encodable` value to JSON data.
  ///
  /// - Parameter type: The value to encode to JSON. Must conform to `Encodable`.
  /// - Returns: JSON data representing the encoded value, or `nil` if encoding fails.
  ///
  /// Example:
  ///
  /// ```swift
  /// let user = User(name: "John Doe", age: 30)
  /// if let jsonData = user.encodeToJSON() {
  ///   print(String(data: jsonData, encoding: .utf8) ?? "Invalid JSON data")
  /// } else {
  ///   print("Failed to encode JSON")
  /// }
  /// ```
  ///
  /// - Note: Ensure that the provided value conforms to the `Encodable` protocol.
  ///
  func encodeToJSON() throws -> Data? {
    do {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted
      return try encoder.encode(self)
    } catch {
      print("Failed to encode JSON: \(error)")
      return nil
    }
  }
}
