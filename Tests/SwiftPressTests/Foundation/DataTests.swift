import XCTest

final class DataTests: XCTestCase {

  // MARK: - User

  private struct User: Decodable {
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

  // MARK: - decodeJSON()

  func test_whenDecodingGivenValidUserJSON_thenUserIsDecoded() {
    // Given
    let userJSON = #"{"name": "John Doe", "age": 30}"#.data(using: .utf8)!

    // When
    let user: User? = userJSON.decodeJSON()

    // Then
    XCTAssertNotNil(user)
    XCTAssertEqual(user?.name, "John Doe")
    XCTAssertEqual(user?.age, 30)
  }

  func test_whenDecodingGivenValidPostArrayJSON_thenPostArrayIsDecoded() {
    // Given
    let postJSON = """
        [
            {
                "id": 1,
                "title": "My Post",
                "body": "This is my post."
            },
            {
                "id": 2,
                "title": "Another Post",
                "body": "This is another post."
            }
        ]
        """
      .data(using: .utf8)!

    // When
    let posts: [Post]? = postJSON.decodeJSON()

    // Then
    XCTAssertNotNil(posts)
    XCTAssertEqual(posts?.count, 2)
  }

  func test_whenDecodingGivenInvalidJSON_thenUserShouldBeNil() {
    // Given
    let invalidJSON = #"{"age": 30}"#.data(using: .utf8)!

    // When
    let user: User? = invalidJSON.decodeJSON()

    // Then
    XCTAssertNil(user)
  }

  // MARK: - toHexString

  func test_whenConvertingDataIntoHexString_thenDataConvertedIntoHexStringSuccessfully() {
    // Given
    let testData1 = "Hello, World!".data(using: .utf8)
    let expectedHex1 = "48656c6c6f2c20576f726c6421"

    let testData2 = Data()
    let expectedHex2: String = .empty

    // When
    let resultHex1 = testData1?.toHexString()
    let resultHex2 = testData2.toHexString()

    // Then
    XCTAssertEqual(resultHex1, expectedHex1, "Hexadecimal conversion for 'Hello, World!' failed.")
    XCTAssertEqual(resultHex2, expectedHex2, "Hexadecimal conversion for an empty data failed.")
  }
}
