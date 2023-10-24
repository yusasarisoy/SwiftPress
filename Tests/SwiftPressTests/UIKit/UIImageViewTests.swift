import XCTest

final class UIImageViewTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - customImageView(imageName:contentMode:)

  func test_whenCreatingCustomImageView_expectPropertiesAreCorrect() {
    // When
    let customImageView = UIImageView.customImageView(
      imageName: "exampleImage",
      contentMode: .center
    )
    customImageView.accessibilityIdentifier = "exampleImage"

    // Then
    XCTAssertEqual((customImageView.accessibilityIdentifier).orEmpty, "exampleImage")
    XCTAssertEqual(customImageView.contentMode, .center)
  }
}
