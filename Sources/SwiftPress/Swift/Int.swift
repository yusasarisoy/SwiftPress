public extension Int {
  /// Checks if the integer is even.
  ///
  /// - Returns: `true` if the integer is even, `false` otherwise.
  ///
  /// Example:
  ///
  /// ```swift
  /// let number = 42
  /// if number.isEven {
  ///   print("The number is even.")
  /// } else {
  ///   print("The number is odd.")
  /// }
  /// ```
  ///
  var isEven: Bool {
    self % 2 == 0
  }
}
