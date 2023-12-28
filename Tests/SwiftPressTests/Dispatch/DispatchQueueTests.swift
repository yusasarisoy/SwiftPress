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

  // MARK: - scheduleRepeatedly(interval:closure:times:)

  func test_whenClosureExecutedExpectedNumberOfTimesForGivenScheduledRepeatedly_thenTimerIsCancelled() {
    // Given
    let expectation = XCTestExpectation(description: "Scheduled repeatedly")
    var counter = 0
    let interval: TimeInterval = 0.1
    let expectedExecutions = 3

    // When
    let timer = DispatchQueue.scheduleRepeatedly(interval: interval) {
      counter += 1
      if counter == expectedExecutions {
        expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: TimeInterval(expectedExecutions) * interval + 1)

    timer.cancel()

    // Then
    XCTAssertEqual(counter, expectedExecutions, "The closure should be executed the expected number of times.")
  }

  func test_whenClosureExecutedExpectedNumberOfTimesForGivenScheduledRepeatedlyIndefinitely_thenTimerIsCancelled() {
    // Given
    let expectation = XCTestExpectation(description: "Scheduled repeatedly indefinitely")
    var counter = 0
    let interval: TimeInterval = 0.1
    let expectedExecutions = 3

    // When
    let timer = DispatchQueue.scheduleRepeatedly(interval: interval) {
      counter += 1
      if counter == expectedExecutions {
        expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: TimeInterval(expectedExecutions) * interval + 1)

    timer.cancel()

    // Then
    XCTAssertEqual(counter, expectedExecutions, "The closure should be executed the expected number of times.")
  }
}
