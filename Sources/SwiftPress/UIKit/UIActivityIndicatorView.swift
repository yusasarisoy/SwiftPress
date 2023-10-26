import UIKit

public extension UIActivityIndicatorView {
  /// Creates a custom UIActivityIndicatorView with specified properties.
  ///
  /// - Parameters:
  ///   - style: The style of the activity indicator (default is `.medium`).
  ///   - color: The color of the activity indicator (default is system color).
  ///   - hidesWhenStopped: A Boolean value indicating whether the activity indicator should be hidden when it's not animating (default is `true`).
  ///
  /// Example:
  ///
  /// ```swift
  ///  let customActivityIndicator = UIActivityIndicatorView.customActivityIndicator(
  ///    style: .whiteLarge,
  ///    color: .red,
  ///    hidesWhenStopped: true
  /// )
  /// ```
  ///
  /// - Returns: A customized `UIActivityIndicatorView` instance.
  ///
  static func customActivityIndicator(
    style: UIActivityIndicatorView.Style = .medium,
    color: UIColor = .systemBlue,
    hidesWhenStopped: Bool = true
  ) -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView(style: style)
    activityIndicator.color = color
    activityIndicator.hidesWhenStopped = hidesWhenStopped
    return activityIndicator
  }
}
