import XCTest

final class DoubleTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - rounded(toPlaces:)

  func test_whenRoundingToDecimalPlacesGivenPositivePlaces_thenShouldReturnRoundedValue() {
    // Given
    let value = 3.14159265359

    // When
    let roundedValue = value.rounded(toPlaces: 2)

    // Then
    XCTAssertEqual(
      roundedValue, 3.14,
      accuracy: 0.001
    )
  }

  func test_whenRoundingToDecimalPlacesGivenNegativePlaces_thenShouldReturnRoundedValue() {
    // Given
    let value = 1234.567

    // When
    let roundedValue = value.rounded(toPlaces: -2)

    // Then
    XCTAssertEqual(
      roundedValue, 1200,
      accuracy: 0.001
    )
  }

  func test_whenRoundingToDecimalPlacesGivenNoChange_thenShouldReturnSameValue() {
    // Given
    let value: Double = 42

    // When
    let roundedValue = value.rounded(toPlaces: 3)

    // Then
    XCTAssertEqual(
      roundedValue, 42.0,
      accuracy: 0.001
    )
  }

  func test_whenRoundingToDecimalPlacesGivenZero_thenShouldReturnZero() {
    // Given
    let value = 0.123456789

    // When
    let roundedValue = value.rounded(toPlaces: 0)

    // Then
    XCTAssertEqual(
      roundedValue, 0.0, 
      accuracy: 0.001
    )
  }

  // MARK: - degreesToRadians

  func test_whenConvertingZeroDegreesToRadians_thenReturnsZeroRadians() {
    // Given
    let degrees = 0.0

    // When
    let radians = degrees.degreesToRadians

    // Then
    XCTAssertEqual(radians, 0.0, accuracy: 0.0001, "Should return 0 radians for 0 degrees")
  }

  func test_whenConverting90DegreesToRadians_thenReturnsPiOver2Radians() {
    // Given
    let degrees = 90.0

    // When
    let radians = degrees.degreesToRadians

    // Then
    XCTAssertEqual(radians, .pi / 2, accuracy: 0.0001, "Should return π/2 radians for 90 degrees")
  }

  func test_whenConverting180DegreesToRadians_thenReturnsPiRadians() {
    // Given
    let degrees = 180.0

    // When
    let radians = degrees.degreesToRadians

    // Then
    XCTAssertEqual(radians, .pi, accuracy: 0.0001, "Should return π radians for 180 degrees")
  }

  func test_whenConvertingNegativeDegreesToRadians_thenReturnsNegativeRadians() {
    // Given
    let degrees = -45.0

    // When
    let radians = degrees.degreesToRadians

    // Then
    XCTAssertEqual(radians, -.pi / 4, accuracy: 0.0001, "Should return -π/4 radians for -45 degrees")
  }

  func test_whenConverting360DegreesToRadians_thenReturnsTwoPiRadians() {
    // Given
    let degrees = 360.0

    // When
    let radians = degrees.degreesToRadians

    // Then
    XCTAssertEqual(radians, 2 * .pi, accuracy: 0.0001, "Should return 2π radians for 360 degrees")
  }
}
