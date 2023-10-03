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
    let expectedEmptyString: String = .empty

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
    var emptyString: String = .empty

    // When
    emptyString.clear()

    // Then
    XCTAssertEqual(emptyString, .empty)
  }

  func test_whenClearNonEmptyString_itShouldBeAnEmptyString() {
    // Given
    var nonEmptyString = "Hello, World!"

    // When
    nonEmptyString.clear()

    // Then
    XCTAssertEqual(nonEmptyString, .empty)
  }

  func test_whenClearNonEmptyStringOfUITextField_itShouldBeAnEmptyString() {
    // Given
    let textField = UITextField()
    textField.text = "This is a UITextField instance."

    // When
    textField.text?.clear()

    // Then
    XCTAssertEqual(textField.text, .empty)
  }

  func test_whenClearNonEmptyStringWithWhitespaces_itShouldBeAnEmptyString() {
    // Given
    var stringWithWhitespace = "  Some text with spaces  "

    // When
    stringWithWhitespace.clear()

    // Then
    XCTAssertEqual(stringWithWhitespace, .empty)
  }

  // MARK: - removeWhitespaceAndNewLines()

  func test_whenRemoveWhitespaceAndNewLinesWithWhitespaceAndNewLines_expectWhitespaceRemoved() {
    // Given
    let inputString = "   Hello, \nWorld!   "

    // When
    let result = inputString.removeWhitespaceAndNewLines()

    // Then
    XCTAssertEqual(result, "Hello,World!")
  }

  func test_whenRemoveWhitespaceAndNewLinesWithoutWhitespaceAndNewLines_expectUnchanged() {
    // Given
    let inputString = "NoWhitespaceOrNewLines"

    // When
    let result = inputString.removeWhitespaceAndNewLines()

    // Then
    XCTAssertEqual(result, inputString)
  }

  func test_whenRemoveWhitespaceAndNewLinesWithEmptyString_expectEmptyString() {
    // Given
    let inputString: String = .empty

    // When
    let result = inputString.removeWhitespaceAndNewLines()

    // Then
    XCTAssertEqual(result, .empty)
  }

  // MARK: - localized(comment:)

  func test_whenHelloWorldBeLocalized_expectToBeLocalizedCorrectly() {
    // Given
    // Define a test localized string in your Localizable.strings file.
    // For example: "hello_world" = "Hello, World!";

    // When
    // let localizedString = "hello_world".localized

    // Then
    // XCTAssertEqual(localizedString, "Hello, World!")
  }
}
