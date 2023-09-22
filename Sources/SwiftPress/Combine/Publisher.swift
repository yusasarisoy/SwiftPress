import Combine
import Foundation

public extension Publisher {
  /// Receives publisher elements on the main thread.
  ///
  /// - Returns: A publisher that delivers elements on the main thread.
  func receiveOnMain() -> Publishers.ReceiveOn<Self, DispatchQueue> {
    receive(on: DispatchQueue.main)
  }
}
