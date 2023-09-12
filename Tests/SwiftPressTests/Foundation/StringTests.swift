import XCTest
@testable import SwiftPress

final class StringTests: XCTestCase {
  
  // MARK: - Test Setup
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Tests
  
  // MARK: - empty
  
  func test_staticEmptyProperty_expectToReturnsEmptyString() {
    // Given
    let expectedEmptyString: String = ""

    // When
    let emptyString = String.empty

    // Then
    XCTAssertEqual(emptyString, expectedEmptyString)
  }

  func test_staticEmptyProperty_expectToNotEqualToNonEmptyString() {
    // Given
    let nonEmptyString: String = "Hello, world!"

    // When
    let emptyString = String.empty

    // Then
    XCTAssertNotEqual(emptyString, nonEmptyString)
  }

  // MARK: - clear()

  func test_whenClearEmptyString_itShouldBeAnEmptyString() {
    // Given
    var emptyString = ""

    // When
    emptyString.clear()

    // Then
    XCTAssertEqual(emptyString, "")
  }

  func test_whenClearNonEmptyString_itShouldBeAnEmptyString() {
    // Given
    var nonEmptyString = "Hello, World!"

    // When
    nonEmptyString.clear()

    // Then
    XCTAssertEqual(nonEmptyString, "")
  }

  func test_whenClearNonEmptyStringOfUITextField_itShouldBeAnEmptyString() {
    // Given
    let textField = UITextField()
    textField.text = "This is a UITextField instance."

    // When
    textField.text?.clear()

    // Then
    XCTAssertEqual(textField.text, "")
  }

  func test_whenClearNonEmptyStringWithWhitespaces_itShouldBeAnEmptyString() {
    // Given
    var stringWithWhitespace = "  Some text with spaces  "

    // When
    stringWithWhitespace.clear()

    // Then
    XCTAssertEqual(stringWithWhitespace, "")
  }
}
