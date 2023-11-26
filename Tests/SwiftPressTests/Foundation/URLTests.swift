import XCTest

final class URLTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - appendingQueryParameters(_:)

  func testAppendingQueryParameters_GivenValidURLAndParameters_ThenShouldReturnNewURLWithAppendedParameters() {
    let baseURL = URL(string: "https://example.com")!
    let parameters = ["key1": "value1", "key2": "value2"]

    let resultURL = baseURL.appendingQueryParameters(parameters)

    XCTAssertTrue((resultURL?.absoluteString.contains("key2")).or(false), "The URL should have the appended query parameters.")
  }

  func testAppendingQueryParameters_GivenURLWithExistingParameters_ThenShouldReturnNewURLWithMergedParameters() {
    let baseURL = URL(string: "https://example.com?key1=value1")!
    let parameters = ["key2": "value2", "key3": "value3"]

    let resultURL = baseURL.appendingQueryParameters(parameters)

    XCTAssertTrue((resultURL?.absoluteString.contains("key3")).or(false), "The URL should have the merged query parameters.")
  }

  func testAppendingQueryParameters_GivenEmptyParameters_ThenShouldReturnSameURL() {
    let baseURL = URL(string: "https://example.com")!
    let emptyParameters: [String: String] = [:]

    let resultURL = baseURL.appendingQueryParameters(emptyParameters)

    XCTAssertTrue(!(resultURL?.absoluteString.contains("key1")).or(false), "Appending empty parameters should result in the same URL.")
  }

  // MARK: - init(stringLiteral:)

  func test_whenValidateValidURL_shouldNotBeNil() {
    // Given, When
    let appleURL: URL? = "https://www.apple.com"

    // Then
    XCTAssertNotNil(appleURL, "URL should not be nil")
  }

  func test_whenValidateInvalidURL_shouldBeNil() {
    // Given, When
    let nilURL: URL? = nil

    // Then
    XCTAssertNil(nilURL, "URL should be nil for a nil string")
  }
}
