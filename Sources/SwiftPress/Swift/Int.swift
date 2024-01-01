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

  /// Checks if the integer is a prime number.
  ///
  /// - Returns: `true` if the integer is a prime number, `false` otherwise.
  ///
  /// Example:
  ///
  /// ```swift
  /// let primeNumber = 17
  /// if primeNumber.isPrime {
  ///   print("It's a prime number.")
  /// } else {
  ///   print("It's not a prime number.")
  /// }
  /// ```
  ///
  var isPrime: Bool {
    guard self > 1 else {
      return false
    }

    for number in 2..<self {
      if self % number == 0 {
        return false
      }
    }
    return true
  }

  /// Calculates the factorial of an integer.
  ///
  /// - Returns: The factorial of the integer, or `nil` if the integer is negative.
  ///
  /// This method uses the `reduce` function on a closed range from 1 to the integer value (inclusive)
  /// to calculate the factorial. If the integer is negative, the result is `nil` since factorial
  /// is undefined for negative numbers.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let number = 5
  /// 
  /// if let result = number.factorial() {
  ///   print("The factorial of \(number) is \(result)")
  /// } else {
  ///   print("Factorial is undefined for negative numbers")
  /// }
  /// ```
  ///
  /// - Warning: The calculation may result in an overflow for large input values.
  ///
  /// - Returns: The factorial of the integer, or `nil` if the integer is negative.
  ///
  func factorial() -> Int? {
    guard self > -1 else {
      return nil
    }

    guard self > .zero else {
      return 1
    }

    return (1...self).reduce(1, *)
  }

  /// Converts the integer to a Roman numeral string.
  ///
  /// This method takes an integer value and returns its Roman numeral representation. The Roman numeral system uses combinations of letters from the Latin alphabet to represent numbers. The provided implementation supports converting integers up to 3999.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let number = 2023
  /// let romanNumeral = number.romanNumeral
  /// print("Roman Numeral for \(number): \(romanNumeral).")
  /// ```
  ///
  /// - Returns: A string representing the Roman numeral equivalent of the integer.
  ///
  var romanNumeral: String {
    guard self > .zero else { return .empty }

    let romanNumerals: [(value: Int, numeral: String)] = [
      (1000, "M"), 
      (900, "CM"),
      (500, "D"),
      (400, "CD"),
      (100, "C"),
      (90, "XC"),
      (50, "L"),
      (40, "XL"),
      (10, "X"), 
      (9, "IX"), 
      (5, "V"),
      (4, "IV"),
      (1, "I")
    ]

    var result: String = .empty
    var value = self

    romanNumerals.forEach {
      while value >= $0.value {
        result += $0.numeral
        value -= $0.value
      }
    }

    return result
  }
}
