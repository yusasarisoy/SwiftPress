import XCTest
@testable import SwiftPress

final class DateTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - formattedString(withFormat:)

  func test_whenFormattedStringWithDifferentFormat_expectDateFormationIsCorrect() {
    // Given
    let date = Date(timeIntervalSince1970: 1697106218) // Oct 12, 2023
    let format = "MMM dd, yyyy"

    // When
    let formattedDate = date.formattedString(withFormat: format)

    // Then
    XCTAssertEqual(formattedDate, "Oct 12, 2023")
  }

  func test_whenFormattedStringWithDifferentFormatIncludingAtDay_expectDateFormationIsCorrect() {
    // Given
    let date = Date(timeIntervalSince1970: 1697106218) // Thursday, October 12, 2023
    let format = "EEEE, MMMM dd, yyyy"

    // When
    let formattedDate = date.formattedString(withFormat: format)

    // Then
    XCTAssertEqual(formattedDate, "Thursday, October 12, 2023")
  }

  // MARK: - formatDate(format:timeZone:locale:)

  func test_whenFormatingDateWithUTCTimeZone_thenShouldBeFormattedCorrectly() {
    // Given
    let testDate = Date(timeIntervalSince1970: 1643642700) // January 31, 2022, 3:45:00 PM UTC

    // When
    let formattedDate = testDate.formatDate(
      format: "yyyy-MM-dd HH:mm:ss", 
      timeZone: TimeZone(abbreviation: "UTC")
    )

    // Then
    XCTAssertEqual(formattedDate, "2022-01-31 3:25:00 PM", "The date should be formatted correctly.")
  }

  // MARK: - daysDifference(from:)

  func test_whenFindDaysDifference_expectTheDifferenceIsTrue() {
    // Given
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"

    guard
      let date1 = dateFormatter.date(from: "2023-10-20"),
      let date2 = dateFormatter.date(from: "2023-11-10") else {
      XCTFail()
      return
    }

    // When
    let daysDifference = date1.daysDifference(from: date2)

    // Then
    XCTAssertEqual(daysDifference, 21)
  }

  // MARK: - isInPast
  
  func test_whetherGivenPastDateIsInPast_thenShouldReturnTrue() {
    // Given
    let pastDate = Date(timeIntervalSince1970: 0)

    // When, Then
    XCTAssertTrue(pastDate.isInPast, "The past date should be identified as in the past.")
  }
  
  func test_whetherGivenCurrentDateIsInPast_thenShouldReturnFalse() {
    // Given
    let currentDate = Date()

    // When, Then
    XCTAssertTrue(currentDate.isInPast, "The current date should not be identified as in the past.")
  }
  
  func test_whetherGivenFutureDateIsInPast_thenShouldReturnFalse() {
    // Given
    let futureDate = Date(timeIntervalSinceNow: 1000)

    // When, Then
    XCTAssertFalse(futureDate.isInPast, "The future date should not be identified as in the past.")
  }
}
