import XCTest

final class UIApplicationTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - openURL(_:)

  func test_whenOpenURL_thenReturnsValidURL() {
    // Given
    let urlString = "https://www.apple.com"

    // When
    let success = UIApplication.shared.openURL(urlString)

    // Then
    XCTAssertTrue(
      success,
      "Opening a valid URL should return true."
    )
  }

  func test_whenOpenURL_thenReturnsInvalidURL() {
    // Given
    let urlString = "invalid-url"

    // When
    let success = UIApplication.shared.openURL(urlString)

    // Then
    XCTAssertFalse(
      success, 
      "Opening an invalid URL should return false."
    )
  }
}
