import XCTest

public extension Collection {
  /// Filters elements based on a custom condition and applies a transformation to the filtered elements.
  ///
  /// - Parameters:
  ///   - condition: A closure that takes an element and returns a Boolean value indicating whether the element should be included.
  ///   - transform: A closure that takes an element and returns a transformed value.
  /// - Returns: An array containing the transformed values of the elements that satisfy the condition.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [1, 2, 3, 4, 5]
  /// let squaredEvenNumbers = numbers.filterAndTransform(
  ///   condition: { $0 % 2 == 0 },
  ///   transform: { $0 * $0 }
  /// )
  /// // Result: [4, 16]
  /// ```
  ///
  func filterAndTransform<T>(
    condition: (Element) -> Bool,
    transform: (Element) -> T
  ) -> [T] {
    filter(condition).map(transform)
  }
}

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
