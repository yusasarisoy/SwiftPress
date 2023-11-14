import XCTest

final class NSAttributedStringTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - init(htmlString:)

  func test_whenConvertingGivenValidHTMLString_thenItIsNotNil() {
    // Given
    let validHTMLString = "<p>This is a <b>bold</b> and <i>italic</i> text.</p>"

    // When
    let attributedString = NSAttributedString(htmlString: validHTMLString)

    // Then
    XCTAssertNotNil(attributedString, "Valid HTML string should create a non-nil attributed string.")

    if let attributedString = attributedString {
      // Assert that the attributed string contains the expected fragments
      XCTAssertTrue(attributedString.string.contains("This is a"))
      XCTAssertTrue(attributedString.string.contains("bold"))
      XCTAssertTrue(attributedString.string.contains("italic"))
    }
  }
}
