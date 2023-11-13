public extension Optional where Wrapped: Collection {
  /// Checks if the collection is either nil or empty.
  ///
  /// - Returns: `true` if the collection is nil or empty; otherwise, `false`.
  ///
  /// This extension property allows you to easily check if a collection is either nil or empty.
  ///
  /// Example:
  ///
  /// ```swift
  /// let emptyArray: [Int]? = []
  /// let nonEmptyArray: [String]? = ["apple", "banana"]
  /// let nilArray: [Double]? = nil
  ///
  /// if emptyArray.isNilOrEmpty {
  ///     print("The array is nil or empty.")
  /// } else {
  ///     print("The array is not nil or empty.")
  /// }
  ///
  /// if nonEmptyArray.isNilOrEmpty {
  ///     print("The array is nil or empty.")
  /// } else {
  ///     print("The array is not nil or empty.")
  /// }
  ///
  /// if nilArray.isNilOrEmpty {
  ///     print("The array is nil or empty.")
  /// } else {
  ///     print("The array is not nil or empty.")
  /// }
  /// ```
  ///
  var isNilOrEmpty: Bool {
    (self?.isEmpty).or(true)
  }
}
