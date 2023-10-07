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
}
