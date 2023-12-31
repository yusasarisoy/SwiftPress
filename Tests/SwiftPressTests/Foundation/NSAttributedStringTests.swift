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

  // MARK: - withFont(_:)

  func test_whenCreateNSAttributedStringFromGivenStringAndFont_thenReturnsAttributedStringWithFont() {
    // Given
    let originalString = "Hello, World!"
    let customFont = UIFont.boldSystemFont(ofSize: 18)
    let attributedString = NSAttributedString(string: originalString)

    // When
    let updatedAttributedString = attributedString.withFont(customFont)

    // Then
    XCTAssertNotNil(updatedAttributedString, "Should return an attributed string")
    let attributes = updatedAttributedString.attributes(at: 0, effectiveRange: nil)
    XCTAssertEqual(attributes[.font] as? UIFont, customFont, "Should have the specified font")
  }
}
