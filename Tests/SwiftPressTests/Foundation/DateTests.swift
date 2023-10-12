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
}
