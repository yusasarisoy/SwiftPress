public extension Optional where Wrapped: Numeric {
  /// A property that returns zero for nil values.
  ///
  /// If the optional value is nil, this property returns zero; otherwise, it returns the non-nil value.
  ///
  /// Example:
  ///
  /// ```swift
  /// let optionalInteger: Int? = nil
  /// let result1 = optionalInteger.orZero
  /// print("Result 1: \(result1).") // Output: "Result 1: 0."
  ///
  /// let nonNilDouble: Double? = 3.14
  /// let result2 = nonNilDouble.orZero
  /// print("Result 2: \(result2).") // Output: "Result 2: 3.14."
  /// ```
  ///
  var orZero: Wrapped {
    self ?? .zero
  }
}
