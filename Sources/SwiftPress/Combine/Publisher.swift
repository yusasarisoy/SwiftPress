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
}
