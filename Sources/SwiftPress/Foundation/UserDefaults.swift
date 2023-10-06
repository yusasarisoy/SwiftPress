import Foundation

public extension UserDefaults {
  /// Retrieves and decodes a custom object from UserDefaults using the specified key.
  ///
  /// - Parameters:
  ///   - key: The key under which the custom object is stored in UserDefaults.
  ///
  /// - Returns: An optional generic object of type `Element`, decoded from the data stored under the given `key`. Returns `nil` if no data is found or if decoding fails.
  ///
  /// This method retrieves binary data from UserDefaults using the provided `key` and attempts to decode it into an object of the specified generic type `Element` using `JSONDecoder`. If the data is successfully decoded, the decoded object is returned; otherwise, `nil` is returned.
  ///
  /// Example:
  /// 
  /// ```swift
  /// let storedPerson: Person? = UserDefaults.standard.getCustomObject(forKey: "personKey")
  /// ```
  ///
  /// - Note: Ensure that the generic type `Element` is compatible with the data stored under the given `key` and conforms to the `Decodable` protocol. Decoding failure will result in a return value of `nil`.
  ///
  /// - SeeAlso: `setCustomObject(_:forKey:)` method for storing custom objects in UserDefaults.
  ///
  func getCustomObject<Element>(forKey key: String) -> Element? where Element: Decodable {
    guard let data = data(forKey: key) else {
      return nil
    }
    return try? JSONDecoder().decode(
      Element.self,
      from: data
    )
  }

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
