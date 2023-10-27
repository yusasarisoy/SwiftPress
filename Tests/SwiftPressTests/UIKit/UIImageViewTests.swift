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

  // MARK: - circularImageView(image:borderWidth:borderColor:)

  func test_whenCreatingCircularImageView_expectPropertiesAreCorrect() {
    // Given
    let image = UIImage(systemName: "person.fill") ?? UIImage()

    // When
    let circularImageView = UIImageView.circularImageView(
      image: image, 
      borderWidth: 3,
      borderColor: .blue
    )

    // Then
    XCTAssertEqual(circularImageView.contentMode, .scaleAspectFill)
    XCTAssertEqual(circularImageView.clipsToBounds, true)
    XCTAssertEqual(circularImageView.layer.cornerRadius, circularImageView.frame.size.width / 2)
    XCTAssertEqual(circularImageView.layer.borderWidth, 3)
    XCTAssertEqual(circularImageView.layer.borderColor, UIColor.blue.cgColor)
  }
}
