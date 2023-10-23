import UIKit

public extension UIButton {
  /// Creates a custom UIButton with a specified title, background color, and target action.
  ///
  /// - Parameters:
  ///   - title: The title to set for the button.
  ///   - backgroundColor: The background color of the button.
  ///   - target: The target object for the button's action.
  ///   - action: The action to perform when the button is tapped.
  ///   - forEvent: The event that triggers the action (default is `.touchUpInside`).
  ///
  /// Example:
  ///
  /// ```swift
  /// let customButton = UIButton.customButton(
  ///   title: "Tap Me",
  ///   backgroundColor: .blue,
  ///   target: self,
  ///   action: #selector(didTapButton)
  /// )
  /// ```
  ///
  /// - Returns: A customized UIButton instance.
  ///
  static func customButton(
    title: String,
    backgroundColor: UIColor,
    target: Any?,
    action: Selector,
    forEvent: UIControl.Event = .touchUpInside
  ) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.backgroundColor = backgroundColor
    button.addTarget(target, action: action, for: forEvent)
    return button
  }
}

