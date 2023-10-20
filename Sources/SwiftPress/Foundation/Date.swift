import Foundation

public extension Date {
  /// An extension on the `Date` type that formats a date into a string using a specified date format.
  ///
  /// - Parameters:
  ///   - format: A string representing the date format to be used for formatting.
  ///
  /// - Returns: A string representation of the date in the specified format.
  ///
  /// - Note:
  ///   This extension is useful for converting `Date` objects into human-readable date and time strings in a format of your choice. It uses a `DateFormatter` to provide flexibility in formatting.
  ///
  /// - Example:
  ///
  /// ```swift
  /// // Create a `Date` object representing the current date and time.
  /// let currentDate = Date()
  ///
  /// // Format the date into a string with a custom date format.
  /// let formattedDate = currentDate.formattedString(withFormat: "MMM dd, yyyy HH:mm:ss")
  /// print("Formatted date: \(formattedDate)")
  /// ```
  ///
  func formattedString(withFormat format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
}
