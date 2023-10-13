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

  // MARK: - init(hex:alpha:)

  func test_whenCreateColorFromHex_expectRGBsAreCorrect() {
    // When
    let redColor = UIColor(hex: 0xFF0000)
    let greenColor = UIColor(hex: 0x00FF00)
    let blueColor = UIColor(hex: 0x0000FF)

    // Then
    XCTAssertEqual(
      redColor,
      .red
    )
    XCTAssertEqual(
      greenColor,
      .green
    )
    XCTAssertEqual(
      blueColor,
      .blue
    )
  }

  func test_whenCreateColorFromHexWithAlpha_expectRGBsAndAlphaAreCorrect() {
    // Given
    let semiTransparentBlueColor = UIColor(
      hex: 0x0000FF,
      alpha: 0.5
    )

    // When
    let redComponent = CIColor(color: semiTransparentBlueColor).red
    let greenComponent = CIColor(color: semiTransparentBlueColor).green
    let blueComponent = CIColor(color: semiTransparentBlueColor).blue
    let alphaComponent = CIColor(color: semiTransparentBlueColor).alpha

    // Then
    XCTAssertEqual(
      redComponent,
      .zero
    )
    XCTAssertEqual(
      greenComponent,
      .zero
    )
    XCTAssertEqual(
      blueComponent,
      1
    )
    XCTAssertEqual(
      alphaComponent,
      0.5
    )
  }
}
