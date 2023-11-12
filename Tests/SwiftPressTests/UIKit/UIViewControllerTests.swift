import XCTest

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

  // MARK: - dismissKeyboardOnTap()

  func test_whenTapGestureAddedGivenViewControllerWithDismissKeyboardOnTap_thenGestureRecognizerIsAdded() {
    // Given
    let viewController = MockViewController()
    let tapGestureRecognizerCountBefore = (viewController.view.gestureRecognizers?.count).orZero

    // When
    viewController.dismissKeyboardOnTap()
    let tapGestureRecognizerCountAfter = (viewController.view.gestureRecognizers?.count).orZero

    // Then
    XCTAssertGreaterThan(tapGestureRecognizerCountAfter, tapGestureRecognizerCountBefore, "Tap gesture recognizer should be added.")
  }

  func test_whenTapGestureSimulatedGivenFirstResponderTextFieldWithDismissKeyboardOnTap_thenTextFieldResignsFirstResponder() {
    // Given
    let viewController = MockViewController()
    let textField = viewController.textField
    textField.becomeFirstResponder() // Make the text field the first responder

    // When
    viewController.dismissKeyboardOnTap()
    viewController.dismissKeyboard() // Simulate tap gesture

    // Then
    XCTAssertFalse(textField.isFirstResponder, "Text field should resign first responder status.")
  }
}

// MARK: - MockViewController

final class MockViewController: UIViewController {

  // MARK: - Properties

  let textField = UITextField()
  var capturedPresentedViewController: UIViewController?

  // MARK: - Override Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(textField)
  }

  override func present(
    _ viewControllerToPresent: UIViewController,
    animated flag: Bool,
    completion: (() -> Void)? = nil
  ) {
    capturedPresentedViewController = viewControllerToPresent
    completion?()
  }
}
