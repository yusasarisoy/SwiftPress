import Foundation

public extension Double {
  /// Round a double to a specified number of decimal places.
  ///
  /// - Parameter places: The number of decimal places to round to.
  /// - Returns: The rounded double value.
  ///
  /// Example:
  ///
  /// ```swift
  /// let value = 3.14159265359
  /// let roundedValue = value.rounded(toPlaces: 2)
  /// print(roundedValue) // 3.14
  /// ```
  ///
  /// This extension method allows you to round a double to a specific number of decimal places.
  /// It works by multiplying the double by a power of 10 to move the decimal point, rounding the result, and then dividing it back to the original scale.
  /// This is useful for formatting numbers for display or any scenario requiring specific decimal precision.
  ///
  /// - Note: If the `places` parameter is negative, it will round to the nearest power of 10 (e.g., if `places` is -1, the double will be rounded to the nearest 10th).
  ///
  /// - Parameter places: The number of decimal places to round to. Use a positive integer for decimal places, or a negative integer to round to the nearest power of 10.
  ///
  /// - Returns: The rounded double value.
  ///
  func rounded(toPlaces places: Int) -> Double {
    let multiplier = pow(10, Double(places))
    return (self * multiplier).rounded() / multiplier
  }

  /// Converts degrees to radians.
  ///
  /// - Returns: The value in radians.
  ///
  /// Example:
  ///
  /// ```swift
  /// let degrees = 90.0
  /// let radians = degrees.degreesToRadians
  /// print(radians) // Outputs: 1.5708 (approximately)
  /// ```
  /// 
  var degreesToRadians: Double {
    self * .pi / 180.0
  }

  /// Converts radians to degrees.
  ///
  /// This extension on `Double` provides a convenient way to convert radians to degrees.
  /// The conversion formula used is: `degrees = radians * 180.0 / π`.
  ///
  /// - Returns: The value in degrees.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let radians = 1.5708
  /// let degrees = radians.radiansToDegrees
  /// print(degrees) // Outputs: 90.0
  /// ```
  ///
  var radiansToDegrees: Double {
    self * 180.0 / .pi
  }
}
