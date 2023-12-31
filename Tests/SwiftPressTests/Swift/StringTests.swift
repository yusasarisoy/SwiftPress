import XCTest

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

  // MARK: - isValidEmail()

  func testValidEmail() {
    // Given
    let emailAddress = "user@example.com"

    // Wheb
    let isValid = emailAddress.isValidEmail()

    // Then
    XCTAssertTrue(isValid)
  }

  func testInvalidEmail() {
    // Given
    let emailAddress = "invalid-email"

    // When
    let isValid = emailAddress.isValidEmail()

    // Then
    XCTAssertFalse(isValid)
  }

  func testEmptyEmail() {
    // Given
    let emailAddress = ""

    // When
    let isValid = emailAddress.isValidEmail()

    // Then
    XCTAssertFalse(isValid)
  }

  func testWhitespaceEmail() {
    // Given
    let emailAddress = "   "

    // When
    let isValid = emailAddress.isValidEmail()

    // Then
    XCTAssertFalse(isValid)
  }

  func testMultipleAtSymbolsEmail() {
    // Given
    let emailAddress = "user@exam@ple.com"

    // When
    let isValid = emailAddress.isValidEmail()

    // Then
    XCTAssertFalse(isValid)
  }

  // MARK: - toURL()

  func test_whenValidURLConversion_expectURLIsNotNil() {
    // Given
    let urlString = "https://www.apple.com"

    // When
    let url = urlString.toURL()

    // Then
    XCTAssertNotNil(url)
    XCTAssertEqual(url?.absoluteString, urlString)
  }

  func test_whenEmptyStringConversion_expectURLIsNil() {
    // Given
    let urlString = ""

    // When
    let url = urlString.toURL()

    // Then
    XCTAssertNil(url)
  }

  // MARK: - truncate(to:)

  func test_whenTruncatedGivenShortStringToLongerLength_thenOriginalStringIsReturned() {
    // Given
    let originalString = "Short string"

    // When
    let truncatedString = originalString.truncate(to: 20)

    // Then
    XCTAssertEqual(truncatedString, "Short string")
  }

  func test_whenTruncatedGivenLongStringToShorterLength_thenStringIsTruncatedWithEllipsis() {
    // Given
    let originalString = "This is a very long string that needs to be truncated."

    // When
    let truncatedString = originalString.truncate(to: 20)

    // Then
    XCTAssertEqual(truncatedString, "This is a very long ...")
  }

  func test_whenTruncatedToSameLengthStringWithExactLength_thenOriginalStringIsReturned() {
    // Given
    let originalString = "Exactly 10"

    // When
    let truncatedString = originalString.truncate(to: 10)

    // Then
    XCTAssertEqual(truncatedString, "Exactly 10")
  }

  func test_whenTruncatedGivenEmptyString_thenEmptyStringIsReturned() {
    // Given
    let originalString = String.empty

    // When
    let truncatedString = originalString.truncate(to: 5)

    // Then
    XCTAssertEqual(truncatedString, .empty)
  }

  // MARK: - isNumeric

  func test_givenValueIsNumeric_shouldReturnTrueForNumericString() {
    // Given
    let numericString = "12345"

    // When
    let isNumeric = numericString.isNumeric

    // Then
    XCTAssertTrue(isNumeric, "Expected true for a numeric string.")
  }

  func test_givenValueIsNumeric_shouldReturnFalseForNonNumericString() {
    // Given
    let nonNumericString = "abc123"

    // When
    let isNumeric = nonNumericString.isNumeric

    // Then
    XCTAssertFalse(isNumeric, "Expected false for a non-numeric string.")
  }

  func test_givenValueIsNumeric_shouldReturnFalseForEmptyString() {
    // Given
    let emptyString: String = .empty

    // When
    let isNumeric = emptyString.isNumeric

    // Then
    XCTAssertFalse(isNumeric, "Expected false for an empty string.")
  }

  // MARK: - safeToInt()

  func test_whenCallingSafeToIntForGivenNumericString_thenShouldReturnInteger() {
    // Given
    let numericString = "123"

    // When
    let result = numericString.safeToInt()

    // Then
    XCTAssertEqual(result, 123, "Conversion of numeric string should result in 123.")
  }

  func test_whenCallingSafeToIntForGivenNonNumericString_thenShouldReturnNil() {
    // Given
    let nonNumericString = "abc"

    // When
    let result = nonNumericString.safeToInt()

    // Then
    XCTAssertNil(result, "Conversion of non-numeric string should result in nil.")
  }

  func test_whenCallingSafeToIntForGivenEmptyString_thenShouldReturnNil() {
    // Given
    let emptyString: String = .empty

    // When
    let result = emptyString.safeToInt()

    // Then
    XCTAssertNil(result, "Conversion of empty string should result in nil.")
  }

  // MARK: - capitalizeEachWord()

  func test_whenCapitalizeEachWord_shouldReturnCapitalizedWords() {
    // Given
    let inputString = "hello world"

    // When
    let capitalizedString = inputString.capitalizeEachWord()

    // Then
    XCTAssertEqual(capitalizedString, "Hello World", "Capitalize each word is incorrect.")
  }

  // MARK: - slugify()

  func test_whenSlugifyTheGivenStringWithSpacesAndSpecialCharacters_thenShouldReturnValidSlug() {
    // Given
    let inputString = "Hello World! This is a Test."
    let expectedSlug = "hello-world-this-is-a-test"

    // When
    let resultSlug = inputString.slugify()

    // Then
    XCTAssertEqual(resultSlug, expectedSlug, "The slugified string should match the expected result.")
  }

  func test_whenSlugifyTheGivenEmptyString_thenShouldReturnEmptySlug() {
    // Given
    let inputString: String = .empty
    let expectedSlug: String = .empty

    // When
    let resultSlug = inputString.slugify()

    // Then
    XCTAssertEqual(resultSlug, expectedSlug, "The slugified string of an empty string should be empty.")
  }

  func test_whenSlugifyTheGivenStringWithOnlySpecialCharacters_thenShouldReturnEmptySlug() {
    // Given
    let inputString = "!@#$%^&*()"
    let expectedSlug: String = .empty

    // When
    let resultSlug = inputString.slugify()

    // Then
    XCTAssertEqual(resultSlug, expectedSlug, "The slugified string of a string with only special characters should be empty.")
  }

  // MARK: - countOccurrences()

  func test_whenCountOccurrencesOfStringWithVariousCharacters_thenReturnsCorrectCharacterCounts() {
    // Given
    let text = "hello"

    // When
    let characterCounts = text.countOccurrences()

    // Then
    XCTAssertEqual(
      characterCounts,
      ["h": 1, "e": 1, "l": 2, "o": 1],
      "Should return the correct character occurrences"
    )
  }

  func test_whenCountOccurrencesOfEmptyString_thenReturnsEmptyDictionary() {
    // Given
    let emptyString = ""

    // When
    let characterCounts = emptyString.countOccurrences()

    // Then
    XCTAssertTrue(characterCounts.isEmpty, "Should return an empty dictionary for an empty string")
  }

  func test_whenCountOccurrencesOfStringWithRepeatedCharacters_thenReturnsCorrectCharacterCounts() {
    // Given
    let text = "programming"

    // When
    let characterCounts = text.countOccurrences()

    // Then
    XCTAssertEqual(
      characterCounts,
      ["p": 1, "r": 2, "o": 1, "g": 2, "a": 1, "m": 2, "i": 1, "n": 1],
      "Should return the correct character occurrences"
    )
  }

  // MARK: - toBase64()

  func test_whenConvertGivenStringToBase64_thenReturnsBase64EncodedString() {
    // Given
    let originalString = "Hello, World!"

    // When
    let base64String = originalString.toBase64()

    // Then
    XCTAssertEqual(base64String, "SGVsbG8sIFdvcmxkIQ==", "Should return the correct base64-encoded string")
  }

  func test_whenConvertGivenEmptyStringToBase64_thenReturnsEmptyString() {
    // Given
    let emptyString: String = .empty

    // When
    let base64String = emptyString.toBase64()

    // Then
    XCTAssertEqual(base64String, .empty, "Should return an empty string for an empty input")
  }

  // MARK: - trimWhitespace()

  func test_whenTrimWhitespaceTheStringThatContainsWhitespace_shouldReturnTrimmedString() {
    // Given
    let stringWithWhitespace = "   Hello, World!   "

    // When
    let trimmedString = stringWithWhitespace.trimWhitespace()

    // Then
    XCTAssertEqual(trimmedString, "Hello, World!")
  }

  func test_whenTrimWhitespaceTheStringThatIsEmpty_shouldReturnEmptyString() {
    // Given
    let emptyString: String = .empty

    // When
    let trimmedString = emptyString.trimWhitespace()

    // Then
    XCTAssertEqual(trimmedString, .empty)
  }

  func test_whenTrimWhitespaceTheStringThatContainsOnlyWhitespace_shouldReturnEmptyString() {
    // Given
    let stringWithOnlyWhitespace = "    \t\n"

    // When
    let trimmedString = stringWithOnlyWhitespace.trimWhitespace()

    // Then
    XCTAssertEqual(trimmedString, .empty)
  }

  func test_whenTrimWhitespaceTheStringThatContainsNoWhitespace_shouldReturnOriginalString() {
    // Given
    let stringWithNoWhitespace = "Hello,World!"

    // When
    let trimmedString = stringWithNoWhitespace.trimWhitespace()

    // Then
    XCTAssertEqual(trimmedString, "Hello,World!")
  }

  // MARK: - isValidIPv4Address()

  func test_whenCheckWhetherIPv4AddressIsValid_shouldBeValidIPv4Address() {
    // Given
    let validIpAddresses = ["192.168.1.1", "10.0.0.1", "127.0.0.1"]

    // When
    for ipAddress in validIpAddresses {
      let isValid = ipAddress.isValidIPv4Address()

      // Then
      XCTAssertTrue(isValid, "IPv4 address \(ipAddress) should be valid.")
    }
  }

  func test_whenCheckWhetherIPv4AddressIsValid_shouldBeInvalidIPv4Address() {
    // Given
    let invalidIpAddresses = ["192.168.1.", "10.0.001", "0.0.0.b"]

    // When
    for ipAddress in invalidIpAddresses {
      let isValid = ipAddress.isValidIPv4Address()

      // Then
      XCTAssertFalse(isValid, "IPv4 address \(ipAddress) should not be invalid.")
    }
  }

  // MARK: - contains(substring:)

  func test_whenCheckingGivenStringContainsSubstring_thenShouldReturnTrue() {
    // Given
    let originalString = "Hello, World!"

    // When
    let containsSubstring = originalString.contains(substring: "World")
    let doesNotContainSubstring = originalString.contains(substring: "Swift")

    // Then
    XCTAssertTrue(containsSubstring, "String should contain the substring.")
    XCTAssertFalse(doesNotContainSubstring, "String should not contain the substring.")
  }

  func test_whenCheckingGivenStringContainsCaseInsensitiveSubstring_thenShouldReturnTrue() {
    // Given
    let originalString = "Hello, World!"

    // When
    let containsSubstring = originalString.range(of: "WORLD", options: .caseInsensitive) != nil

    // Then
    XCTAssertTrue(containsSubstring, "String should contain the case-insensitive substring.")
  }

  // MARK: - snakeCaseToCamelCase()

  func test_whenConvertingSnakeCaseToCamelCase_thenShouldBeConvertedSuccessfully() {
    // Given
    let snakeCaseString = "hello_world_swift"

    // When
    let camelCaseString = snakeCaseString.snakeCaseToCamelCase()

    // Then
    XCTAssertEqual(camelCaseString, "HelloWorldSwift", "The snake_case string should be converted to CamelCase.")
  }

  // MARK: - camelToSnakeCase()

  func test_whenConvertingCamelCaseToSnakeCase_thenShouldBeConvertedSuccessfully() {
    // Given
    let inputString = "myVariableName"
    let expectedResult = "my_variable_name"

    // When
    let result = inputString.camelToSnakeCase()

    // Then
    XCTAssertEqual(result, expectedResult, "Conversion from camel case to snake case failed")
  }

  // MARK: - isBlank

  func test_whenCheckingWhetherEmptyStringIsBlank_thenReturnsTrue() {
    // Given
    let emptyString: String = .empty

    // When
    let result = emptyString.isBlank

    // Then
    XCTAssertTrue(result, "Expected an empty string to be blank")
  }

  func test_whenCheckingWhetherWhitespaceStringIsBlank_thenItReturnsTrue() {
    // Given
    let whitespaceString = "    "

    // When
    let result = whitespaceString.isBlank

    // Then
    XCTAssertTrue(result, "Expected a whitespace string to be blank")
  }

  func test_whenCheckingWhetherNonEmptyStringIsBlank_thenReturnsFalse() {
    // Given
    let nonEmptyString = "Hello, World!"

    // When
    let result = nonEmptyString.isBlank

    // Then
    XCTAssertFalse(result, "Expected a non-empty string to not be blank")
  }

  // MARK: - boolValue

  func test_whenBoolValueCalledForGivenValidTrueString_thenShouldReturnTrue() {
    // Given
    let trueString = "true"

    // When
    let result = trueString.boolValue

    // Then
    XCTAssertTrue(result, "Expected true for '\(trueString)'")
  }

  func test_whenBoolValueCalledForGivenValidFalseString_thenShouldReturnFalse() {
    // Given
    let falseString = "false"

    // When
    let result = falseString.boolValue

    // Then
    XCTAssertFalse(result, "Expected false for '\(falseString)'")
  }

  func test_whenBoolValueCalledForGivenUpperCaseTrueString_thenShouldReturnTrue() {
    // Given
    let upperCaseTrueString = "TRUE"

    // When
    let result = upperCaseTrueString.boolValue

    // Then
    XCTAssertTrue(result, "Expected true for '\(upperCaseTrueString)' (case-insensitive)")
  }

  func test_whenBoolValueCalledForGivenMixedCaseFalseString_thenShouldReturnFalse() {
    // Given
    let mixedCaseFalseString = "FaLsE"

    // When
    let result = mixedCaseFalseString.boolValue

    // Then
    XCTAssertFalse(result, "Expected false for '\(mixedCaseFalseString)' (case-insensitive)")
  }

  func test_whenBoolValueCalledForGivenInvalidString_thenShouldReturnFalse() {
    // Given
    let invalidString = "invalid"

    // When
    let result = invalidString.boolValue

    // Then
    XCTAssertFalse(result, "Expected false for '\(invalidString)' (invalid value)")
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
