import XCTest

final class TimeIntervalTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - formatAsMinutesAndSeconds()

  func test_whenFormattingGivenTimeIntervalsAsMinutesAndSeconds_thenShouldReturnFormattedValues() {
    // Given
    let timeInterval1: TimeInterval = 125
    let timeInterval2: TimeInterval = 3620
    let timeInterval3: TimeInterval = 30

    // When
    let formattedTime1 = timeInterval1.formatAsMinutesAndSeconds()
    let formattedTime2 = timeInterval2.formatAsMinutesAndSeconds()
    let formattedTime3 = timeInterval3.formatAsMinutesAndSeconds()

    // Then
    XCTAssertEqual(formattedTime1, "02:05", "Formatting 125 seconds should result in '02:05'")
    XCTAssertEqual(formattedTime2, "60:20", "Formatting 3620 seconds should result in '60:20'")
    XCTAssertEqual(formattedTime3, "00:30", "Formatting 30 seconds should result in '00:30'")
  }
}
