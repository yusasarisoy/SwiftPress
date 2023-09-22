import Combine
import XCTest
@testable import SwiftPress

final class PublisherTests: XCTestCase {

  // MARK: - Properties

  private var cancellables = Set<AnyCancellable>()

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    // Remove all Combine subscriptions.
    cancellables.removeAll()

    super.tearDown()
  }

  // MARK: - Tests

  func test_whenReceiveValueOnMain_expectGettingTheValueOnMainThread() {
    // Given
    let expectation = XCTestExpectation(description: "Receive the value on main queue.")
    let subject = PassthroughSubject<Int, Never>()

    // When
    subject
      .receiveOnMain()
      .sink { value in
        // Then
        XCTAssertTrue(Thread.isMainThread)
        XCTAssertEqual(value, 42)
        expectation.fulfill()
      }
      .store(in: &cancellables)

    DispatchQueue.global().async {
      subject.send(42)
    }

    wait(for: [expectation], timeout: 1.0)
  }
}
