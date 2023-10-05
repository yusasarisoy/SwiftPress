import Foundation

public extension UserDefaults {
  /// Stores a custom object in `UserDefaults` under the specified key.
  ///
  /// - Parameters:
  ///   - object: The custom object to be stored. It must conform to the `Encodable` protocol.
  ///   - key: The key under which the custom object will be stored.
  ///
  /// This method encodes the provided `object` as JSON data and stores it in `UserDefaults` under the specified `key`.
  ///
  /// Example:
  ///
  /// ```swift
  /// let person = Person(
  ///   name: "Alice",
  ///   age: 30
  /// )
  ///
  /// UserDefaults.standard.setCustomObject(
  ///   person,
  ///   forKey: "personKey"
  /// )
  /// ```
  ///
  /// To use this method, ensure that the `object` parameter conforms to the `Encodable` protocol.
  ///
  /// - Note: If the object is not `Encodable`, this method will fail silently, and no data will be stored.
  ///
  func setCustomObject<Element>(
    _ object: Element,
    forKey key: String
  ) where Element: Encodable {
    let data = try? JSONEncoder().encode(object)
    set(data, forKey: key)
  }
}
