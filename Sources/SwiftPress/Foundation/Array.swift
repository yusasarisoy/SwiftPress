public extension Array {
  /// Finds the index of the first occurrence of an element in the array.
  ///
  /// - Parameter element: The element to find in the array.
  ///
  /// - Returns: The index of the first occurrence of `element` in the array, or `nil` if the element is not found.
  ///
  /// This method creates a dictionary-based index lookup during the first enumeration of the array elements. 
  /// Subsequent lookups for the first occurrence of an element are O(1) time complexity.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [10, 20, 30, 40, 30, 50]
  ///
  /// // Using firstIndex(of:) to find the index of the first occurrence of 30.
  /// if let index = numbers.firstIndex(of: 30) {
  ///     print("Index of 30: \(index).") // Output: Index of 30: 2.
  /// }
  /// ```
  ///
  /// - Warning: This method assumes that the element type is `Hashable`. If the element type is not `Hashable`, 
  /// consider using other methods for finding indices.
  ///
  func firstIndex(of element: Element) -> Int? where Element: Hashable {
    // Create a dictionary that maps elements to their indices.
    var indexLookup = [Element: Int]()
    for (index, value) in enumerated() {
      // Store the index of the first occurrence of each element.
      if indexLookup[value] == nil {
        indexLookup[value] = index
      }
    }

    // Look up the index for the specified element.
    return indexLookup[element]
  }

  /// Safely access an element at the specified index.
  ///
  /// This subscript allows you to access an element in the array without
  /// causing an index out-of-range error. If the provided index is within
  /// the bounds of the array, it returns the element; otherwise, it returns nil.
  ///
  /// - Parameter safe: The index at which you want to access an element safely.
  /// - Returns: An optional element of the array's element type (`Element?`).
  ///            Returns `nil` if the index is out of bounds.
  ///
  /// Example:
  ///
  /// ```swift
  /// var fruits = ["apple", "banana", "cherry", "date"]
  ///
  /// let firstFruit = fruits[safe: 0] // "apple"
  /// let thirdFruit = fruits[safe: 2] // "cherry"
  /// let fifthFruit = fruits[safe: 4] // nil (out of bounds)
  /// ```
  ///
  subscript(safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }

  /// An extension for arrays that adds the `isNotEmpty` property, allowing you to check if the array is not empty.
  ///
  /// Example:
  ///
  /// ```swift
  /// let emptyArray: [Int] = []
  /// let nonEmptyArray: [String] = ["apple", "banana"]
  ///
  /// print("Is emptyArray not empty? \(emptyArray.isNotEmpty)") // false
  /// print("Is nonEmptyArray not empty? \(nonEmptyArray.isNotEmpty)") // true
  /// ```
  ///
  var isNotEmpty: Bool {
    !isEmpty
  }
}

// MARK: - Numeric

public extension Array where Element: Numeric {
  /// Calculates the sum of all elements in the array.
  ///
  /// - Returns: The sum of all elements in the array.
  ///
  /// This extension method is available on arrays whose elements conform to the `Numeric` protocol.
  /// It allows you to easily calculate the sum of all elements in the array.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [1, 2, 3, 4, 5]
  /// let sum = numbers.sum()
  /// print("The sum of the numbers is \(sum).") // Output: The sum of the numbers is 15.
  /// ```
  ///
  /// - Note: If the array is empty, the result will be the additive identity of the `Numeric` type, which is typically 0.
  ///
  /// - SeeAlso: `Numeric`
  ///
  func sum() -> Element {
    reduce(0, +)
  }

  /// Calculates the product of all elements in the array.
  ///
  /// - Returns: The product of all elements in the array.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [2, 3, 4]
  /// let product = numbers.product()
  /// print("Product of numbers: \(product).")
  /// ```
  ///
  func product() -> Element {
    reduce(1, *)
  }
}
