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

  // MARK: - isPrime

  func test_whenCheckWhetherGivenPrimeNumberIsPrime_thenShouldReturnTrue() {
    // Given, When, Then
    XCTAssertTrue(17.isPrime, "The number 17 should be identified as a prime number.")
  }

  func test_whenCheckWhetherGivenNonPrimeNumberIsPrime_thenShouldReturnFalse() {
    // Given, When, Then
    XCTAssertFalse(15.isPrime, "The number 15 should not be identified as a prime number.")
  }

  func test_whenCheckWhetherGivenNegativeNumberIsPrime_thenShouldReturnFalse() {
    // Given, When, Then
    XCTAssertFalse((-5).isPrime, "Negative numbers should not be identified as prime numbers.")
  }

  func test_whenCheckWhetherGivenZeroAndOneIsPrime_thenShouldReturnFalse() {
    // Given, When, Then
    XCTAssertFalse(0.isPrime, "The number 0 should not be identified as a prime number.")
    XCTAssertFalse(1.isPrime, "The number 1 should not be identified as a prime number.")
  }
}
