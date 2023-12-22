import Foundation

public extension TimeInterval {
  /// Formats the time interval as a string with minutes and seconds.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let duration: TimeInterval = 125
  /// let formattedTime = duration.formatAsMinutesAndSeconds()
  /// print(formattedTime) // Output: "02:05"
  /// ```
  ///
  /// - Note: This extension is useful for converting a time interval, such as the duration of a video, into a human-readable string format.
  ///
  /// - Returns: A formatted string in the "mm:ss" format representing the minutes and seconds of the time interval.
  ///
  /// - Complexity: O(1)
  ///
  func formatAsMinutesAndSeconds() -> String {
    let minutes = Int(self / 60)
    let seconds = Int(self.truncatingRemainder(dividingBy: 60))
    return String(format: "%02d:%02d", minutes, seconds)
  }
}
