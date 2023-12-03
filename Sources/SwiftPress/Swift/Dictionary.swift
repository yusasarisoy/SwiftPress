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
}
