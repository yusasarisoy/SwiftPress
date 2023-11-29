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

  /// Checks if the integer is odd.
  ///
  /// - Returns: `true` if the integer is odd, `false` otherwise.
  ///
  /// Example:
  ///
  /// ```swift
  /// let number = 37
  /// if number.isOdd {
  ///   print("The number is odd.")
  /// } else {
  ///   print("The number is even.")
  /// }
  /// ```
  ///
  var isOdd: Bool {
    self % 2 != 0
  }
}
