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

  /// Formats the date into a custom string representation.
  ///
  /// This method allows formatting a `Date` object into a string using a specified date format.
  ///
  /// - Parameters:
  ///   - format: The desired date format.
  ///   - timeZone: The time zone to use for the formatted string. Default is the current time zone.
  ///   - locale: The locale to use for the formatted string. Default is the current locale.
  /// - Returns: A string representation of the date in the specified format.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let currentDate = Date()
  /// let formattedDate = currentDate.formatDate(format: "yyyy-MM-dd HH:mm:ss")
  /// print(formattedDate) // Example output: "2023-01-31 15:45:00"
  /// ```
  ///
  func formatDate(
    format: String,
    timeZone: TimeZone? = nil,
    locale: Locale? = nil
  ) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.timeZone = timeZone ?? TimeZone.current
    dateFormatter.locale = locale ?? Locale.current
    return dateFormatter.string(from: self)
  }

  /// Calculates the difference in days between two dates.
  ///
  /// - Parameters:
  ///   - date: The date to calculate the difference from.
  ///
  /// - Returns: The number of days between the two dates. A positive result means the given date is in the future.
  ///
  /// - Note:
  ///   This method uses the `Calendar.current` calendar to calculate the difference in days between two dates.
  ///
  /// - Example:
  ///
  ///   ```swift
  ///   let dateFormatter = DateFormatter()
  ///   dateFormatter.dateFormat = "yyyy-MM-dd"
  ///
  ///   let today = dateFormatter.date(from: "2023-10-20")!
  ///   let futureDate = dateFormatter.date(from: "2023-11-10")!
  ///
  ///   let daysDifference = today.daysDifference(from: futureDate)
  ///   print("The difference in days is: \(daysDifference).") // Output: 21
  ///   ```
  ///
  func daysDifference(from date: Date) -> Int {
    // Calculate the date components (in this case, just days) between two dates.
    let components = Calendar
      .current
      .dateComponents(
        [.day],
        from: self,
        to: date
      )

    // Return the number of days, defaulting to 0 in case of an error.
    return components.day ?? .zero
  }

  /// Checks if the date is in the past.
  ///
  /// - Returns: `true` if the date is in the past, `false` otherwise.
  ///
  /// Example:
  ///
  /// ```swift
  /// let currentDate = Date()
  /// let pastDate = Date(timeIntervalSince1970: 0)
  /// if pastDate.isInPast {
  ///   print("The date is in the past.")
  /// } else {
  ///   print("The date is not in the past.")
  /// }
  /// ```
  ///
  var isInPast: Bool {
    self <= Date()
  }

  /// Gets the day of the week as a string.
  ///
  /// - Returns: A string representing the day of the week.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let currentDate = Date()
  /// let dayOfWeek = currentDate.dayOfTheWeek()
  ///
  /// print("Current date: \(currentDate).")
  /// print("Day of the week: \(dayOfWeek).")
  /// ```
  ///
  func dayOfTheWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: self)
  }
}
