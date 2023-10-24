import XCTest

final class UIStackViewTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - addArrangedSubviews

  /// Tests the `addArrangedSubviews` extension method to ensure it adds subviews to the stack view correctly.
  func test_whenAddArrangedSubviews_expectToAddSubviewsToStackView() {
    // Given
    let stackView = UIStackView()
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()

    // When
    stackView.addArrangedSubviews([view1, view2, view3])

    // Then
    XCTAssertEqual(stackView.arrangedSubviews.count, 3)
    XCTAssertTrue(stackView.arrangedSubviews.contains(view1))
    XCTAssertTrue(stackView.arrangedSubviews.contains(view2))
    XCTAssertTrue(stackView.arrangedSubviews.contains(view3))
  }
}
