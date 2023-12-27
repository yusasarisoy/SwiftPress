import Combine
import Foundation

public extension Publisher {
  /// Receives publisher elements on the main thread.
  ///
  /// - Returns: A publisher that delivers elements on the main thread.
  func receiveOnMain() -> Publishers.ReceiveOn<Self, DispatchQueue> {
    receive(on: DispatchQueue.main)
  }

  /// Filters out `nil` values from the publisher, transforming it into a new publisher with non-optional elements.
  ///
  /// - Returns: A publisher that emits non-optional elements from the original publisher.
  ///
  /// - Note: This extension is particularly useful when dealing with publishers that emit optional values, and you want to exclude `nil` from the stream.
  ///
  /// ## Example
  ///
  /// ```swift
  /// let optionalNumbers: [Int?] = [1, nil, 3, nil, 5]
  /// let publisher = optionalNumbers.publisher
  /// let nonNilPublisher = publisher.filterNotNil()
  /// nonNilPublisher.sink { value in
  ///   print(value) // Output: 1, 3, 5
  /// }
  /// ```
  ///
  /// - Warning: This operator will force-unwrap optional values. Ensure that the optionals are expected to be non-nil, or use it with caution.
  ///
  /// - Returns: A publisher that emits non-optional elements from the original publisher.
  ///
  func filterNotNil<Element>() -> Publishers.CompactMap<Self, Element> where Output == Element? {
    compactMap { $0 }
  }

  /// Logs each received value to the console.
  ///
  /// This extension is designed to be used with Combine publishers and is particularly
  /// useful for debugging and understanding the flow of values in a Combine sequence.
  ///
  /// - Returns: A publisher that emits the same output and failure types as the original publisher.
  ///
  /// - Note: The `@discardableResult` attribute is used to suppress the warning
  ///         "Result of call to 'print(_:to:)' is unused" when calling the `print` function.
  ///
  /// - Warning: Avoid using this extension in production code where logging might be
  ///            inappropriate or where performance considerations are critical.
  ///
  /// - SeeAlso: `handleEvents(receiveOutput:)`, `eraseToAnyPublisher()`
  ///
  /// ## Example
  ///
  /// ```swift
  /// // Create a Combine publisher that emits two integers.
  /// let integerPublisher = Just(42)
  ///   .delay(for: .seconds(1), scheduler: DispatchQueue.main)
  ///
  /// // Subscribe to the publisher, apply logValues extension, and sink the values.
  /// let cancellable = integerPublisher
  ///   .logValues()
  ///   .sink { receivedValue in
  ///     print("Processed value: \(receivedValue).")
  ///   }
  ///
  /// // Cancel the subscription after a delay
  /// DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
  ///   cancellable.cancel()
  /// }
  /// ```
  ///
  @discardableResult
  func logValues() -> AnyPublisher<Output, Failure> {
    handleEvents(receiveOutput: { value in
      _ = print("Received value: \(value).")
    })
    .eraseToAnyPublisher()
  }
}
