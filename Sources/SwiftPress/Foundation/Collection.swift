import XCTest

/// An extension to easily check if a collection contains a specific element.
public extension Collection where Element: Equatable {
  /// Returns a Boolean value indicating whether the collection contains the specified element.
  ///
  /// - Parameter element: The element to search for within the collection.
  /// - Returns: `true` if the collection contains the specified element; otherwise, `false`.
  ///
  /// This method performs a linear search through the collection elements using the `==` operator
  /// to compare each element with the specified element. It returns `true` if a matching element
  /// is found; otherwise, it returns `false`.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [1, 2, 3, 4, 5]
  /// let containsThree = numbers.contains(3) // true
  /// let containsTen = numbers.contains(10) // false
  /// ```
  ///
  /// - Complexity: O(*n*), where *n* is the number of elements in the collection.
  ///
  func contains(_ element: Element) -> Bool {
    contains { $0 == element }
  }
}

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
