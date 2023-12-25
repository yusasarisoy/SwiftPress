import XCTest

final class URLSessionTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - asyncDataTask(with:)

  func test_whenSuccessfulRequestAsyncDataTask_thenReceivesDataAndValidResponse() async {
    // Given
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
      XCTFail()
      return
    }

    // When, Then
    do {
      let (data, response) = try await URLSession.shared.asyncDataTask(with: url)

      XCTAssertTrue((200..<300).contains((response as! HTTPURLResponse).statusCode))
      XCTAssertFalse(data.isEmpty)
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }

  func test_whenFailingRequestAsyncDataTask_thenThrowsNetworkError() async {
    // Given
    guard let url = URL(string: "https://www,yusasarisoy.com") else {
      XCTFail()
      return
    }

    // When, Then
    do {
      _ = try await URLSession.shared.asyncDataTask(with: url)
      XCTFail("Expected an error but did not receive one.")
    } catch {
      XCTAssertNotNil(error)
      XCTAssertTrue(error is URLSession.NetworkError)
    }
  }

  func test_whenSuccessfulRequestAsyncJSONTask_thenDecodesTodoObject() async {
    // Given
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
      XCTFail()
      return
    }

    // When, Then
    do {
      struct Todo: Decodable {
        let id: Int
        let title: String
        let completed: Bool
      }

      let todo = try await URLSession.shared.asyncJSONTask(with: url, decodingType: Todo.self)

      XCTAssertNotNil(todo)
      XCTAssertGreaterThan(todo.id, 0)
      XCTAssertFalse(todo.title.isEmpty)
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }

  func test_whenFailingRequestAsyncJSONTask_thenThrowsNetworkError() async {
    // Given
    guard let url = URL(string: "https://nonexistenturl12345.com") else {
      XCTFail()
      return
    }

    // When, Then
    do {
      _ = try await URLSession.shared.asyncJSONTask(with: url, decodingType: String.self)
      XCTFail("Expected an error but did not receive one.")
    } catch {
      XCTAssertNotNil(error)
      XCTAssertTrue(error is URLSession.NetworkError)
    }
  }
}
