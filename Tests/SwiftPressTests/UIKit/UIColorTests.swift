import XCTest
@testable import SwiftPress

final class UIColorTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - init(hex:alpha:)

  func test_whenCreateUIColorFromValidHex_expectColorNotToBeNil() {
    // Given
    let hexColor = "#FF5733"

    // When
    let color = UIColor(hex: hexColor)

    // Then
    XCTAssertNotNil(color, "Color should not be nil.")
  }

  func test_whenCreateUIColorFromInvalidHex_expectColorToBeNil() {
    // Given
    let invalidHex = "invalidHexCode"

    // When
    let color = UIColor(hex: invalidHex)

    // Then
    XCTAssertNil(color, "Color should be nil for an invalid hex code.")
  }

  func testCreateUIColorWithCustomAlpha_expectColorNotToBeNil() {
    // Given
    let hexColor = "#FF5733"
    let alpha: CGFloat = 0.5

    // When
    let color = UIColor(
      hex: hexColor,
      alpha: alpha
    )

    // Then
    XCTAssertNotNil(color, "Color should not be nil.")
  }
}
