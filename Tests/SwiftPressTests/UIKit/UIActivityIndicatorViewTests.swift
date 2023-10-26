import XCTest

final class UIActivityIndicatorViewTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - customActivityIndicator(style:color:hidesWhenStopped:)

  func test_whenCreatingCustomActivityIndicatorView_expectItsPropertiesAreTrue() {
    // When
    let customActivityIndicator = UIActivityIndicatorView.customActivityIndicator(
      style: .medium,
      color: .blue,
      hidesWhenStopped: true
    )

    // Then
    XCTAssertEqual(customActivityIndicator.style, .medium)
    XCTAssertEqual(customActivityIndicator.color, .blue)
    XCTAssertTrue(customActivityIndicator.hidesWhenStopped)
  }
}
