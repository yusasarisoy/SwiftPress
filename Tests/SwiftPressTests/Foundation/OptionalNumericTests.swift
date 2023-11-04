import XCTest

final class OptionalNumericTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - orZero

  func testOrZeroWithNilInteger() {
    // Given
    let optionalInteger: Int? = nil

    // When
    let result = optionalInteger.orZero

    // Then
    XCTAssertEqual(result, 0)
  }

  func testOrZeroWithNonNilInteger() {
    // Given
    let nonNilInteger: Int? = 42

    // When
    let result = nonNilInteger.orZero

    // Then
    XCTAssertEqual(result, 42)
  }

  func testOrZeroWithNilDouble() {
    // Given
    let optionalDouble: Double? = nil

    // When
    let result = optionalDouble.orZero

    // Then
    XCTAssertEqual(result, 0.0, accuracy: 0.0001)
  }

  func testOrZeroWithNonNilDouble() {
    // Given
    let nonNilDouble: Double? = 3.14

    // When
    let result = nonNilDouble.orZero

    // Then
    XCTAssertEqual(result, 3.14, accuracy: 0.0001)
  }
}
