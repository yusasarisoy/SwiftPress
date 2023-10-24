import XCTest

final class FileManagerTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - documentsDirectory()

  func testDocumentsDirectory() {
    // Given
    let fileManager = FileManager()
    var isDirectory: ObjCBool = false

    // When
    guard let documentsURL = fileManager.documentsDirectory() else {
      // Then
      XCTFail("Unable to access the documents directory.")
      return
    }

    XCTAssertNotNil(
      documentsURL,
      "Documents URL should not be nil."
    )
    XCTAssertEqual(
      documentsURL.lastPathComponent,
      "Documents",
      "Last path component should be 'Documents'."
    )
    XCTAssertTrue(
      fileManager.fileExists(
        atPath: documentsURL.path,
        isDirectory: &isDirectory
      ),
      "Documents URL should be a directory."
    )
    XCTAssertTrue(
      isDirectory.boolValue,
      "Documents URL should be a directory."
    )
  }
}
