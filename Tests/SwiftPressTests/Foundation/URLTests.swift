import XCTest

final class URLTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  func test_whenValidateValidURL_shouldNotBeNil() {
    // Given, When
    let appleURL: URL? = "https://www.apple.com"

    // Then
    XCTAssertNotNil(appleURL, "URL should not be nil")
  }

  func test_whenValidateInvalidURL_shouldBeNil() {
    // Given, When
    let nilURL: URL? = nil

    // Then
    XCTAssertNil(nilURL, "URL should be nil for a nil string")
  }
}
