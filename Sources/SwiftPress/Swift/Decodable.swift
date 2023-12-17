import Foundation

public extension Decodable {
  /// Decodes an instance of the conforming type from JSON Data.
  ///
  /// - Parameter data: The JSON data to be decoded into an instance of the type.
  /// - Returns: An instance of the conforming type, decoded from the provided JSON data.
  /// - Throws: An error if decoding fails, such as if the data is not valid JSON or
  ///           if it does not match the expected structure of the conforming type.
  ///
  /// - Note: This method uses `JSONDecoder` to perform the decoding operation.
  ///
  /// ## Example
  ///
  /// ```swift
  /// struct Person: Decodable {
  ///   var name: String
  ///   var age: Int
  /// }
  ///
  /// guard let jsonData = #"{"name": "John", "age": 30}"#.data(using: .utf8) else {
  ///   return
  /// }
  ///
  /// do {
  ///   let decodedPerson = try Person.fromJSONData(jsonData)
  ///   print(decodedPerson) // Person(name: "John", age: 30)
  /// } catch {
  ///   print("Error decoding JSON data: \(error).")
  /// }
  /// ```
  ///
  static func fromJSONData(_ data: Data) throws -> Self {
    try JSONDecoder().decode(Self.self, from: data)
  }
}
