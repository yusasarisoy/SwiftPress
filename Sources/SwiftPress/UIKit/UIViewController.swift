import UIKit

public extension UIViewController {
  /// Show an alert with a title and message.
  ///
  /// - Parameters:
  ///   - title: The title for the alert.
  ///   - message: The message to display in the alert.
  ///
  /// Example:
  ///
  /// ```swift
  /// // Inside a UIViewController, you can use this extension to display an alert.
  /// showAlert(
  ///   title: "Alert Title",
  ///   message: "This is a sample alert message."
  /// )
  /// ```
  ///
  /// The `showAlert` method creates a simple UIAlertController with an "OK" button and presents it.
  /// You can call this method in any UIViewController to quickly show an alert with a title and message.
  func showAlert(
    title: String,
    message: String
  ) {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
    let okAction = UIAlertAction(
      title: "OK",
      style: .default,
      handler: nil
    )
    alertController.addAction(okAction)
    present(
      alertController,
      animated: true
    )
  }

  /// Dismisses the keyboard when tapping outside of the keyboard or any interactive view.
  ///
  /// Example:
  ///
  /// ```swift
  /// final class MyViewController: UIViewController {
  ///
  ///   // MARK: - Lifecycle Methods
  ///
  ///   override func viewDidLoad() {
  ///     super.viewDidLoad()
  ///     dismissKeyboardOnTap()
  ///   }
  /// }
  ///
  /// ```
  ///
  func dismissKeyboardOnTap() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    tapGesture.cancelsTouchesInView = false
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc
  func dismissKeyboard() {
    view.endEditing(true)
  }
}
