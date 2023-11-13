import XCTest

final class DispatchQueueTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  func test_whenExecutionHasDelayed_shouldExecuteAfterSpecifiedDuration() {
    // Given
    let expectation = XCTestExpectation(description: "Delayed execution")

    // When
    let startTime = CACurrentMediaTime()
    DispatchQueue.delay(seconds: 2) {
      // Then
      let endTime = CACurrentMediaTime()
      XCTAssertGreaterThanOrEqual(endTime - startTime, 2, "Delayed execution should take at least 2 seconds")
      expectation.fulfill()
    }

    // Wait for the expectation to be fulfilled
    wait(for: [expectation], timeout: 3)
  }

  func test_whenThereAreMultipleDelays_shouldExecuteInSequenceWithDifferentDurations() {
    // Given
    let expectation = XCTestExpectation(description: "Multiple delayed executions")
    expectation.expectedFulfillmentCount = 3

    // When
    var count = 0
    DispatchQueue.delay(seconds: 1) {
      // Then
      count += 1
      XCTAssertEqual(count, 1, "First delayed execution should occur")
      expectation.fulfill()
    }

    DispatchQueue.delay(seconds: 2) {
      // Then
      count += 1
      XCTAssertEqual(count, 2, "Second delayed execution should occur")
      expectation.fulfill()
    }

    DispatchQueue.delay(seconds: 3) {
      // Then
      count += 1
      XCTAssertEqual(count, 3, "Third delayed execution should occur")
      expectation.fulfill()
    }

    // Wait for the expectation to be fulfilled
    wait(for: [expectation], timeout: 5)
  }
}
