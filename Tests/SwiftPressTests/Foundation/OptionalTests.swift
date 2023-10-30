import XCTest

final class OptionalTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - or(_:)

  func test_givenOptionalWithValueWhenUsingOrWithDefaultValue_thenReturnsValue() {
    // Given
    let optionalValue: Int? = 42

    // When
    let result = optionalValue.or(0)

    // Then
    XCTAssertEqual(result, 42)
  }

  func test_givenOptionalNilWhenUsingOrWithDefaultValue_thenReturnsDefaultValue() {
    // Given
    let optionalValue: Int? = nil

    // When
    let result = optionalValue.or(10)

    // Then
    XCTAssertEqual(result, 10)
  }

  func test_givenOptionalNilWhenUsingOrWithoutDefaultValue_thenReturnsNonOptional() {
    // Given
    let optionalValue: String? = nil

    // When
    let result = optionalValue.or("Default")

    // Then
    XCTAssertEqual(result, "Default")
  }

  func test_givenOptionalWithValueWhenUsingOrWithNonDefaultValue_thenReturnsValue() {
    // Given
    let optionalValue: String? = "Hello, World!"

    // When
    let result = optionalValue.or("Fallback")

    // Then
    XCTAssertEqual(result, "Hello, World!")
  }

  // MARK: - isNil

  func test_whenCheckingIsNilForGivenNonNilOptional_thenExpectToBeReturnFalse() {
    // Given
    let someValue: Int? = 42

    // When
    let result = someValue.isNil

    // Then
    XCTAssertFalse(result)
  }

  func test_whenCheckingIsNilForGivenNilOptional_thenExpectToBeReturnTrue() {
    // Given
    let nilValue: Int? = nil

    // When
    let result = nilValue.isNil

    // Then
    XCTAssertTrue(result)
  }
} 
