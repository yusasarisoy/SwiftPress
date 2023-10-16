import XCTest
@testable import SwiftPress

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
}
