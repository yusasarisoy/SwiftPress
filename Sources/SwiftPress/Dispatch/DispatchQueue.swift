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

  /// Schedules a closure to be repeatedly executed with a specified time interval.
  ///
  /// - Parameters:
  ///   - interval: The time interval between each execution.
  ///   - closure: The closure to execute.
  ///   - times: The number of times the closure should be executed. If `nil`, the closure is executed indefinitely until canceled.
  ///
  /// - Returns: A dispatch work item that can be used to cancel the scheduled execution.
  ///
  /// ## Example
  ///
  /// ```swift
  /// var counter = 0
  ///
  /// let timer = DispatchQueue.scheduleRepeatedly(interval: 1.0) {
  ///   counter += 1
  ///   print("Executed \(counter) times")
  /// }
  ///
  /// // Cancel the timer after 5 seconds
  /// DispatchQueue.delay(seconds: 5.0) {
  ///   timer.cancel()
  /// }
  /// ```
  ///
  @discardableResult
  static func scheduleRepeatedly(
    interval: TimeInterval,
    closure: @escaping () -> Void,
    times: Int? = nil
  ) -> DispatchWorkItem {
    var remainingTimes = times
    let workItem = DispatchWorkItem {
      closure()
      if let remaining = remainingTimes {
        remainingTimes = remaining - 1
        if remainingTimes == 0 {
          return
        }
      }
      scheduleRepeatedly(interval: interval, closure: closure, times: remainingTimes)
    }

    main.asyncAfter(deadline: .now() + interval, execute: workItem)
    return workItem
  }
}
