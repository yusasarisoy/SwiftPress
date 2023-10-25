import XCTest

final class UISwitchTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - customSwitch(isOn:tintColor:onTintColor:)

  func test_whenCreatingCustomSwitch_expectItsPropertiesAreTrue() {
    // When
    let customSwitch = UISwitch.customSwitch(
      isOn: true,
      tintColor: .red,
      onTintColor: .green
    )

    // Then
    XCTAssertTrue(customSwitch.isOn)
    XCTAssertEqual(customSwitch.tintColor, .red)
    XCTAssertEqual(customSwitch.onTintColor, .green)
  }
}
