public extension Dictionary {
  /// Filters the dictionary based on a predicate.
  ///
  /// - Parameter isIncluded: A closure that takes a key-value pair as its parameter and returns a Boolean value indicating whether the pair should be included in the result.
  /// - Returns: A new dictionary containing only the key-value pairs that satisfy the given predicate.
  ///
  /// Example:
  ///
  /// ```swift
  /// let scores = ["Alice": 85, "Bob": 92, "Charlie": 78, "David": 95]
  /// let passingScores = scores.customFilter { $0.value >= 90 }
  /// print(passingScores) // Outputs: ["Bob": 92, "David": 95]
  /// ```
  ///
  func customFilter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Key: Value] {
    var result: [Key: Value] = [:]
    for (key, value) in self where try isIncluded((key, value)) {
      result[key] = value
    }
    return result
  }

  /// Merges two dictionaries. Values from the second dictionary overwrite values of the first dictionary for the same key.
  ///
  /// - Parameter other: The dictionary to merge into the current dictionary.
  ///
  /// This method iterates through each key-value pair in the `other` dictionary
  /// and updates the current dictionary with the key-value pairs from `other`.
  /// If a key already exists in the current dictionary, the corresponding value
  /// is overwritten by the value from the `other` dictionary.
  ///
  /// - Note: This operation is performed in-place, modifying the current dictionary.
  ///
  /// ## Example
  ///
  /// ```swift
  /// var firstDictionary = ["a": 1, "b": 2]
  /// let secondDictionary = ["b": 3, "c": 4]
  ///
  /// // In-place merge
  /// firstDictionary.merge(secondDictionary)
  /// print(firstDictionary)  // Prints ["a": 1, "b": 3, "c": 4]
  /// ```
  ///
  /// - Warning: This method modifies the current dictionary in-place.
  /// 
  mutating func merge(_ other: [Key: Value]) {
    for (key, value) in other {
      self[key] = value
    }
  }

  /// Safely retrieve a value for the given key, providing a default value if the key is not present.
  ///
  /// - Parameters:
  ///   - key: The key for which the value is to be retrieved.
  ///   - defaultValue: The default value to be returned if the key is not present.
  ///
  /// - Returns: The value associated with the specified key, or the default value if the key is not found.
  ///
  /// - Complexity:
  ///   Retrieving a value from a dictionary has an average complexity of O(1), making this method efficient.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let scores = ["Alice": 90, "Bob": 85, "Charlie": 95]
  ///
  /// let aliceScore = scores.value(for: "Alice", default: 0)
  /// let davidScore = scores.value(for: "David", default: 0)
  ///
  /// print("Alice's Score: \(aliceScore).")
  /// print("David's Score: \(davidScore).")
  /// ```
  ///
  func value(
    for key: Key,
    default defaultValue: Value
  ) -> Value {
    self[key].or(defaultValue)
  }
}
