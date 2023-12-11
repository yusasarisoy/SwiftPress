import XCTest

final class EncodableTests: XCTestCase {

  // MARK: - User

  private struct User: Encodable {
    let name: String
    let age: Int
  }

  // MARK: - Post

  private struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
  }

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - encodeToJSON()

  func test_whenEncodeToJSONToGivenValidEncodable_shouldEncodeSuccessfully() throws {
    // Given
    let user = User(name: "Jane Doe", age: 25)

    // When
    let jsonData: Data? = try user.encodeToJSON()

    // Then
    XCTAssertNotNil(jsonData)

    if let jsonString = String(data: jsonData!, encoding: .utf8) {
      XCTAssertTrue(jsonString.contains("Jane Doe"))
      XCTAssertTrue(jsonString.contains("25"))
    } else {
      XCTFail("Failed to convert JSON data to string")
    }
  }

  func test_whenEncodeToJSONToGivenInvalidEncodable_shouldReturnNil() throws {
    // Given
    struct InvalidEncodable: Encodable {}
    let invalidValue = InvalidEncodable()

    // When
    let jsonData: Data?
    do {
      jsonData = try invalidValue.encodeToJSON()
    } catch {
      XCTFail("Unexpected error during encoding: \(error)")
      return
    }

    // Then
    XCTAssertNotNil(jsonData, "Expected jsonData not to be nil")
  }
}
