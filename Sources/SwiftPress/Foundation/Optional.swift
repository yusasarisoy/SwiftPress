public extension Optional {
  /// Provides a default value for the optional if it's `nil`.
  ///
  /// - Parameter defaultValue: The value to use as a default if the optional is `nil`.
  /// - Returns: The wrapped value if the optional is not `nil`, or the `defaultValue` if the optional is `nil`.
  ///
  /// Example:
  ///
  /// ```swift
  /// let optionalValue: Int? = nil
  ///
  /// // Using the `or(_:)` method to provide a default value.
  /// let result = optionalValue.or(42)
  /// // result now contains 42 since `optionalValue` is `nil`.
  /// ```
  ///
  func or(_ defaultValue: Wrapped) -> Wrapped {
    self ?? defaultValue
  }

  /// Checks if the optional value is nil.
  ///
  /// - Returns: `true` if the optional is nil, `false` otherwise.
  ///
  /// Example:
  ///
  /// ```swift
  /// let someValue: Int? = 42
  /// let nilValue: Int? = nil
  ///
  /// if someValue.isNil {
  ///   print("someValue is nil.")
  /// } else {
  ///   print("someValue is not nil.")
  /// }
  ///
  /// if nilValue.isNil {
  ///   print("nilValue is nil.")
  /// } else {
  ///   print("nilValue is not nil.")
  /// }
  /// ```
  ///
  var isNil: Bool {
    self == nil
  }
}
