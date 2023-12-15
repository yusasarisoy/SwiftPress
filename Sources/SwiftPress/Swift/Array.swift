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

  /// Splits the array into chunks of a specified size.
  ///
  /// - Parameter chunkSize: The size of each chunk.
  /// - Returns: An array of arrays, where each inner array represents a chunk of elements.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  /// let chunks = numbers.chunked(into: 3)
  /// // Result: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  /// ```
  ///
  func chunked(into chunkSize: Int) -> [[Element]] {
    stride(from: .zero, to: count, by: chunkSize).map {
      Array(self[$0..<Swift.min($0 + chunkSize, count)])
    }
  }

  /// Extracts a subarray from the original array.
  ///
  /// - Parameters:
  ///   - from: The starting index of the subarray.
  ///   - to: The ending index of the subarray.
  ///
  /// - Returns: A subarray of the original array, containing the elements from `from` to `to` (inclusive).
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [1, 2, 3, 4, 5]
  /// let slicedNumbers = numbers.slice(from: 1, to: 3)
  /// print(slicedNumbers) // Output: [2, 3]
  /// ```
  ///
  /// - Precondition:
  ///   - `from` must be within the bounds of the array.
  ///   - `to` must be greater than or equal to `from`.
  ///   - If `to` exceeds the length of the array, the subarray will be truncated to the end of the array.
  ///   - If `from` is greater than or equal to `to`, an empty subarray will be returned.
  func slice(
    from: Int,
    to: Int
  ) -> Array<Element>? {
    guard startIndex..<endIndex ~= from && from <= to && to <= endIndex else {
      return nil
    }

    return Array(self[from ..< to])
  }

  /// Groups elements of the array based on a provided condition.
  ///
  /// - Parameter condition: A closure that defines the grouping condition.
  /// - Returns: A dictionary where keys are the grouping condition results, and values are arrays of elements.
  ///
  /// Example:
  ///
  /// ```swift
  /// let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  /// let groupedByEvenOdd = numbers.groupBy { $0 % 2 == 0 ? "Even" : "Odd" }
  /// print(groupedByEvenOdd)
  /// // Output: ["Even": [2, 4, 6, 8, 10], "Odd": [1, 3, 5, 7, 9]]
  /// ```
  ///
  /// - Complexity: O(n), where n is the number of elements in the array.
  ///
  func groupBy<T: Hashable>(condition: (Element) -> T) -> [T: [Element]] {
    var groupedDictionary = [T: [Element]]()
    
    for element in self {
      let key = condition(element)
      groupedDictionary[key, default: []].append(element)
    }

    return groupedDictionary
  }

  /// Rotates the elements of the array to the left by a specified number of positions.
  ///
  /// - Parameter positions: The number of positions to rotate the elements.
  /// - Returns: A new array with elements rotated to the left.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let numbers = [1, 2, 3, 4, 5]
  /// let rotatedNumbers = numbers.rotateLeft(by: 2)
  /// print(rotatedNumbers)
  /// // Output: [3, 4, 5, 1, 2]
  /// ```
  ///
  func rotateLeft(by positions: Int) -> [Element] {
    guard !isEmpty else { return [] }

    let effectivePositions = positions % count
    var splitIndex = index(startIndex, offsetBy: effectivePositions)
    if splitIndex < 0 {
      splitIndex += self.count
    }
    return Array(self[splitIndex...] + self[..<splitIndex])
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

public extension Array where Element: Hashable {
  /// Returns a new array with duplicate elements removed.
  ///
  /// This method preserves the order of elements while removing duplicates.
  ///
  /// - Returns: A new array with unique elements in the same order as the original array.
  ///
  /// - Complexity: O(n), where n is the number of elements in the array.
  ///
  /// - Note: The order of elements in the resulting array is based on the order of the first occurrences
  ///         of each element in the original array.
  ///
  /// - Example:
  ///
  /// ```swift
  /// let numbers = [1, 2, 2, 3, 4, 4, 5]
  /// let uniqueNumbers = numbers.removingDuplicates() // [1, 2, 3, 4, 5]
  /// ```
  ///
  /// - SeeAlso: `Set`
  /// - SeeAlso: `filter(_:)`
  ///
  func removingDuplicates() -> [Element] {
    var uniqueElements = Set<Element>()
    return filter { uniqueElements.insert($0).inserted }
  }

  /// An extension on arrays containing hashable elements, providing a method to find the most frequently occurring element.
  ///
  /// Example:
  ///
  /// ```swift
  /// let array = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
  /// let mostFrequentElement = array.mostFrequent()
  /// print(mostFrequentElement) // Output: Optional(4)
  /// ```
  ///
  /// - Note: This extension works only on arrays with elements conforming to the `Hashable` protocol.
  ///
  /// - Returns: The most frequent element in the array, or `nil` if the array is empty.
  ///
  /// - Complexity: O(n), where n is the number of elements in the array.
  ///
  func mostFrequent() -> Element? {
    let counts = reduce(into: [:]) { $0[$1, default: 0] += 1 }
    return counts.max { $0.1 < $1.1 }?.key
  }

  /// Finds the intersection of two arrays.
  ///
  /// - Parameter otherArray: The array to find the intersection with.
  /// - Returns: An array containing the common elements between the two arrays.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let array1 = [1, 2, 3, 4, 5]
  /// let array2 = [3, 4, 5, 6, 7]
  /// let intersection = array1.intersection(with: array2)
  /// print(intersection) // Output: [3, 4, 5]
  /// ```
  ///
  func intersection(with otherArray: [Element]) -> [Element] {
    let set1 = Set(self)
    let set2 = Set(otherArray)
    return Array(set1.intersection(set2))
  }
}
