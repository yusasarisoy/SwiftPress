/// An extension on `Optional` for `String` providing a computed property to check if the optional string is nil or empty.
public extension Optional where Wrapped == String {
  /// A Boolean value indicating whether the optional string is nil or empty.
  ///
  /// This property provides a convenient way to check if an optional string is nil or contains an empty string.
  ///
  /// Example:
  /// ```
  /// let nonEmptyOptional: String? = "Hello, World!"
  /// let isEmpty = nonEmptyOptional.isNilOrEmpty // isEmpty will be false.
  ///
  /// let emptyOptional: String? = ""
  /// let isEmpty2 = emptyOptional.isNilOrEmpty // isEmpty2 will be true.
  ///
  /// let nilOptional: String? = nil
  /// let isEmpty3 = nilOptional.isNilOrEmpty // isEmpty3 will be true.
  /// ```
  var isNilOrEmpty: Bool {
    self?.isEmpty ?? true
  }

