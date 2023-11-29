import XCTest

final class IntTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - isEven

  func test_whenCheckWhetherGivenEvenNumberIsEven_thenShouldReturnTrue() {
    // Given
    let evenNumber = 42

    // When, Then
    XCTAssertTrue(evenNumber.isEven, "The even number should be identified as even.")
  }

  func test_whenCheckWhetherGivenOddNumberIsEven_thenShouldReturnFalse() {
    // Given
    let oddNumber = 37

    // When, Then
    XCTAssertFalse(oddNumber.isEven, "The odd number should not be identified as even.")
  }

  func test_whenCheckWhetherGivenZeroIsEven_thenShouldReturnTrue() {
    // Given
    let zero = 0

    // When, Then
    XCTAssertTrue(zero.isEven, "Zero should be identified as even.")
  }

  // MARK: - isOdd

  func test_whenCheckWhetherGivenOddNumberIsOdd_thenShouldReturnTrue() {
    // Given
    let oddNumber = 37

    // When, Then
    XCTAssertTrue(oddNumber.isOdd, "The odd number should be identified as odd.")
  }

  func test_whenCheckWhetherGivenEvenNumberIsOdd_thenShouldReturnFalse() {
    // Given
    let evenNumber = 42

    // When, Then
    XCTAssertFalse(evenNumber.isOdd, "The even number should not be identified as odd.")
  }

  func test_whenCheckWhetherGivenZeroIsOdd_thenShouldReturnFalse() {
    // Given
    let zero = 0

    // When, Then
    XCTAssertFalse(zero.isOdd, "Zero should not be identified as odd.")
  }
}
