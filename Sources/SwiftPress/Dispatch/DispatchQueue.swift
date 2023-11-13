import Foundation

public extension DispatchQueue {
  /// Delays the execution of a closure.
  ///
  /// - Parameters:
  ///   - seconds: The number of seconds to delay.
  ///   - closure: The closure to execute after the delay.
  ///
  /// - Example:
  ///
  /// ```swift
  /// print("Start")
  /// DispatchQueue.delay(seconds: 2) {
  ///   print("Delayed execution after 2 seconds")
  /// }
  /// print("End")
  /// ```
  ///
  static func delay(
    seconds: Double,
    closure: @escaping () -> Void
  ) {
    DispatchQueue.main.asyncAfter(
      deadline: .now() + seconds,
      execute: closure
    )
  }
}
