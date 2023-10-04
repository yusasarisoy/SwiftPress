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
}

// MARK: - Localizable

enum Localizable: String {
    case search
    case randomSelectedGIF
    // Add more cases as needed...
}


final class RawRepresentableTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - rawLocalizedString

  /// Tests the localization of enum cases' raw values.
  func test_whenRawValueSearchBeLocalized_expectToBeLocalizedCorrectly() {
    // Given
    // Assuming that your Localizable.strings file contains translations for these keys.

    // When
    // let localizedSearch = Localizable.search.rawLocalizedString

    // Then
    // Replace these assertions with the actual localized strings from your Localizable.strings file.
    // XCTAssertEqual(localizedSearch, "Localized Search String")
  }
  
  // MARK: - rawLocalizedString(with:)

  func test_whenRawValueSearchBeLocalizedWithParameter_expectToBeLocalizedCorrectly() {
    // Given
    // Define test cases and their expected results.
    // let testCase1 = Localizable.search
    // let parameter1 = "Your Title"
    // let expected1 = "Localized Title: Your Title"
    
    // When
    // let result1 = testCase1.rawLocalizedString(with: parameter1)
    
    // Then
    // XCTAssertEqual(result1, expected1)
  }
}
