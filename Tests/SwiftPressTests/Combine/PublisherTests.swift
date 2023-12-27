import Combine
import XCTest

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

  // MARK: - receiveOnMain()

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

  // MARK: - filterNotNil()

  func test_whenFilteringNotNilGivenOptionalValues_thenReceiveNonNilValues() {
    // Given
    let optionalNumbers: [Int?] = [1, nil, 3, nil, 5]
    let publisher = optionalNumbers.publisher
    let nonNilPublisher = publisher.filterNotNil()

    // When
    let expectation = XCTestExpectation(description: "Receive values from the publisher")
    var receivedValues: [Int] = []

    let cancellable = nonNilPublisher.sink { value in
      receivedValues.append(value)
      if receivedValues.count == 3 {
        expectation.fulfill()
      }
    }

    // Then
    wait(for: [expectation], timeout: 1.0)
    XCTAssertEqual(receivedValues, [1, 3, 5])
    XCTAssertNotNil(cancellable)
  }

  // MARK: - logValues()

  func test_whenLogValuesExtensionGivenPublisherWithValues_thenValuesAreLogged() {
    // Given
    let expectation = XCTestExpectation(description: "Values are logged")
    var loggedValues = [Int]()

    // Create a Combine publisher that emits three integers
    let integerPublisher = PassthroughSubject<Int, Never>()

    // When
    let cancellable = integerPublisher
      .logValues()
      .sink { receivedValue in
        loggedValues.append(receivedValue)
      }

    // Emit values to the publisher
    integerPublisher.send(1)
    integerPublisher.send(2)
    integerPublisher.send(3)

    // Delay the fulfillment of the expectation to ensure all values are processed
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      expectation.fulfill()
    }

    // Then
    wait(for: [expectation], timeout: 2)

    // Verify that values are logged correctly
    XCTAssertEqual(loggedValues, [1, 2, 3])

    // Cancel the subscription
    cancellable.cancel()
  }
}
