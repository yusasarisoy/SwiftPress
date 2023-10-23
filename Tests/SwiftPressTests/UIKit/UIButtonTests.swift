import XCTest
@testable import SwiftPress

final class UIButtonTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - customButton(title:backgroundColor:target:action:forEvent:)

  func test_whenCreatingCustomButton_expectItsPropertiesAreCorrect() {
    // When
    let customButton = UIButton.customButton(
      title: "Test Button", 
      backgroundColor: .green,
      target: self,
      action: #selector(didTapButton)
    )

    // Then
    XCTAssertEqual(customButton.title(for: .normal), "Test Button")
    XCTAssertEqual(customButton.backgroundColor, .green)
    XCTAssertEqual(customButton.allTargets.contains(self), true)
  }

  @objc 
  private func didTapButton() {
    // This is a dummy action for testing.
  }
}
