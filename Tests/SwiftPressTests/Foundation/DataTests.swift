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
}
