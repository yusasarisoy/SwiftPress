import XCTest

final class IntTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - isEven

  func test_whenCheckWhetherGivenEvenNumberIsEven_thenShouldReturnTrue() {
    // Given
    let evenNumber = 42

    // When, Then
    XCTAssertTrue(evenNumber.isEven, "The even number should be identified as even.")
  }

  func test_whenCheckWhetherGivenOddNumberIsEven_thenShouldReturnFalse() {
    // Given
    let oddNumber = 37

    // When, Then
    XCTAssertFalse(oddNumber.isEven, "The odd number should not be identified as even.")
  }

  func test_whenCheckWhetherGivenZeroIsEven_thenShouldReturnTrue() {
    // Given
    let zero = 0

    // When, Then
    XCTAssertTrue(zero.isEven, "Zero should be identified as even.")
  }

  // MARK: - isOdd

  func test_whenCheckWhetherGivenOddNumberIsOdd_thenShouldReturnTrue() {
    // Given
    let oddNumber = 37

    // When, Then
    XCTAssertTrue(oddNumber.isOdd, "The odd number should be identified as odd.")
  }

  func test_whenCheckWhetherGivenEvenNumberIsOdd_thenShouldReturnFalse() {
    // Given
    let evenNumber = 42

    // When, Then
    XCTAssertFalse(evenNumber.isOdd, "The even number should not be identified as odd.")
  }

  func test_whenCheckWhetherGivenZeroIsOdd_thenShouldReturnFalse() {
    // Given
    let zero = 0

    // When, Then
    XCTAssertFalse(zero.isOdd, "Zero should not be identified as odd.")
  }

  // MARK: - isPrime

  func test_whenCheckWhetherGivenPrimeNumberIsPrime_thenShouldReturnTrue() {
    // Given, When, Then
    XCTAssertTrue(17.isPrime, "The number 17 should be identified as a prime number.")
  }

  func test_whenCheckWhetherGivenNonPrimeNumberIsPrime_thenShouldReturnFalse() {
    // Given, When, Then
    XCTAssertFalse(15.isPrime, "The number 15 should not be identified as a prime number.")
  }

  func test_whenCheckWhetherGivenNegativeNumberIsPrime_thenShouldReturnFalse() {
    // Given, When, Then
    XCTAssertFalse((-5).isPrime, "Negative numbers should not be identified as prime numbers.")
  }

  func test_whenCheckWhetherGivenZeroAndOneIsPrime_thenShouldReturnFalse() {
    // Given, When, Then
    XCTAssertFalse(0.isPrime, "The number 0 should not be identified as a prime number.")
    XCTAssertFalse(1.isPrime, "The number 1 should not be identified as a prime number.")
  }

  // MARK: - factorial()

  func test_whenCalculatingFactorialOfGivenNonNegativeInteger_thenValidFactorialIsReturned() {
    // Given
    let testCases: [Int: Int] = [
      0: 1,
      1: 1,
      2: 2,
      3: 6,
      4: 24,
      5: 120
    ]

    // When, Then
    for (input, expected) in testCases {
      let result = input.factorial()
      XCTAssertEqual(result, expected, "Factorial of \(input) should be \(expected), but got \(String(describing: result)).")
    }
  }

  func test_whenCalculatingFactorialOfGivenNegativeInteger_thenNilIsReturned() {
    // Given
    let negativeInteger = -5

    // When
    let result = negativeInteger.factorial()

    // Then
    XCTAssertNil(result, "Factorial should be nil for a negative integer.")
  }

  // MARK: - romanNumeral

  func test_whenConvertPositiveNumberToRomanNumeral_thenItShouldBeConvertedSuccessfully() {
    // Given
    let number = 149

    // When
    let romanNumeral = number.romanNumeral

    // Then
    XCTAssertEqual(romanNumeral, "CXLIX", "Incorrect Roman numeral for the positive number.")
  }

  func test_whenConvertZeroRomanNumeral_thenItShouldBeEmpty() {
    // Given
    let number: Int = .zero

    // When
    let romanNumeral = number.romanNumeral

    // Then
    XCTAssertEqual(romanNumeral, .empty, "Roman numeral for zero should be an empty string.")
  }

  func test_whenConvertNegativeNumberToRomanNumeral_thenItShouldBeEmpty() {
    // Given
    let number = -42

    // When
    let romanNumeral = number.romanNumeral

    // Then
    XCTAssertEqual(romanNumeral, .empty, "Roman numeral for a negative number should be an empty string.")
  }

  // MARK: - formatAsCurrency(locale:)

  func test_whenFormattedWithCustomLocaleGivenPositiveValue_thenFormattedStringContainsCurrencySymbol() {
    // Given
    let price = 1500

    // When
    let formattedPrice = price.formatAsCurrency()

    // Then
    XCTAssertEqual(formattedPrice, "\(Locale.current.currencySymbol!)1.500,00")
  }

  func test_whenFormattedWithCustomLocaleGivenPositiveValue_thenFormattedStringContainsCustomCurrencySymbol() {
    // Given
    let price = 1500
    let customLocale = Locale(identifier: "de_DE")

    // When
    let formattedPrice = price.formatAsCurrency(locale: customLocale)

    // Then
    XCTAssertEqual(formattedPrice, "1.500,00 \(Locale.current.currencySymbol!)")
  }

  func test_whenFormattedGivenNegativeValue_thenFormattedStringContainsNegativeSign() {
    // Given
    let negativePrice = -1500

    // When
    let formattedNegativePrice = negativePrice.formatAsCurrency()
  
    // Then
    XCTAssertEqual(formattedNegativePrice, "-\(Locale.current.currencySymbol!)1.500,00")
  }

  func test_whenFormattedGivenZeroValue_thenFormattedStringContainsZero() {
    // Given
    let zeroPrice = 0

    // When
    let formattedZeroPrice = zeroPrice.formatAsCurrency()

    // Then
    XCTAssertEqual(formattedZeroPrice, "\(Locale.current.currencySymbol!)0,00")
  }
}
