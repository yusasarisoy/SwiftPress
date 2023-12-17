import XCTest

final class DecodableTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - fromJSONData(_:)

  func test_whenDecodingGivenValidJSONDataFromJSONData_thenReturnDecodedInstance() {
    // Given
    guard let jsonData = #"{"name": "John", "age": 30}"#.data(using: .utf8) else {
      return XCTFail()
    }

    // When
    do {
      let decodedPerson = try Person.fromJSONData(jsonData)

      // Then
      XCTAssertEqual(decodedPerson.name, "John")
      XCTAssertEqual(decodedPerson.age, 30)
    } catch {
      XCTFail("Unexpected error: \(error).")
    }
  }

  func test_whenDecodingGivenInvalidJSONDataFromJSONData_thenThrowDecodingError() {
    // Given
    guard let invalidJSONData = #"{"name": "John", "invalidKey": 30}"#.data(using: .utf8) else {
      return XCTFail()
    }

    // When, Then
    XCTAssertThrowsError(try Person.fromJSONData(invalidJSONData)) { error in
      XCTAssertTrue(error is DecodingError)
    }
  }

  func test_whenDecodingGivenEmptyJSONDataFromJSONData_thenThrowDecodingError() {
    // Given
    let emptyJSONData = Data()

    // When, Then
    XCTAssertThrowsError(try Person.fromJSONData(emptyJSONData)) { error in
      XCTAssertTrue(error is DecodingError)
    }
  }
}
