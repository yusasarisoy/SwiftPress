import XCTest
@testable import SwiftPress

final class UIViewControllerTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - showAlert(title:message:)

  func test_whenShowAlert_expectTheAlertIsPresented() {
    // Given
    let mockViewController = MockViewController()

    // When
    mockViewController.showAlert(title: "Test Title", message: "Test Message")

    // Then
    XCTAssertNotNil(mockViewController.capturedPresentedViewController as? UIAlertController)
    let alertController = mockViewController.capturedPresentedViewController as? UIAlertController
    XCTAssertEqual(alertController?.title, "Test Title")
    XCTAssertEqual(alertController?.message, "Test Message")
    XCTAssertEqual(alertController?.actions.count, 1)
  }
}

// MARK: - MockViewController

final class MockViewController: UIViewController {

  // MARK: - Properties

  var capturedPresentedViewController: UIViewController?

  // MARK: - Override Methods

  override func present(
    _ viewControllerToPresent: UIViewController,
    animated flag: Bool,
    completion: (() -> Void)? = nil
  ) {
    capturedPresentedViewController = viewControllerToPresent
    completion?()
  }
}
