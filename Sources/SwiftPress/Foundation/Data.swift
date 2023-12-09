import Foundation

public extension Data {
  /// Takes a `Data` instance as input and attempts to decode it into a specified `Decodable` type, `Element`, using a `JSONDecoder` instance. If the decoding is successful, it returns an instance of type `Element`. Otherwise, it throws a `DecodingError` indicating the error that occurred during decoding.
  ///
  /// - Parameter type: The `Decodable` type to which the JSON data should be decoded.
  ///
  /// - Returns: The decoded JSON object as a `Element` instance if successful, or `nil` if decoding failed.
  ///
  /// - Throws: A `DecodingError` if the JSON data is invalid or cannot be decoded to the specified `Decodable` type.
  ///
  /// Example:
  ///
  /// ``` swift
  /// struct User: Decodable {
  ///   let name: String
  ///   let age: Int
  /// }
  ///
  /// // Decode JSON data to a `User` object.
  /// let userJSON = #"{"name": "John Doe", "age": 30}"#
  /// let user = try? Data(userJSON).toJSON(User.self)
  /// print("Decoded JSON to User object: \(user)")
  /// ```
  ///
  func toJSON<Element: Decodable>(_ type: Element.Type) throws -> Element? {
    do {
      return try JSONDecoder().decode(Element.self, from: self)
    } catch {
      print("Failed to decode JSON to \(Element.self): \(error).")
      return nil
    }
  }
}
