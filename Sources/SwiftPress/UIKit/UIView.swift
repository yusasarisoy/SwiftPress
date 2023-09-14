import UIKit

public extension UIView {
  /// Create and activate constraints to align the edges of the view with its superview's edges, optionally applying padding.
  ///
  /// This method simplifies the process of setting up constraints to make the view's edges match its superview's edges.
  /// It creates and activates constraints for the leading, trailing, top, and bottom edges of the view, ensuring alignment
  /// with the corresponding edges of its superview. An optional padding value can be provided to add space between
  /// the view's edges and the superview's edges.
  ///
  /// - Parameter padding: The padding value to apply to all edges. Default is zero.
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  /// - Note: The `translatesAutoresizingMaskIntoConstraints` property of the view is set to `false` within this method to ensure
  ///   compatibility with Auto Layout.
  ///
  /// - Warning: Using excessive padding values or very large numbers may result in unexpected layout issues.
  ///
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  ///
  /// Example:
  /// ```
  /// let myFirstView = UIView()
  /// myFirstView.edgesEqualToSuperview()
  ///
  /// let mySecondView = UIView()
  /// mySecondView.edgesEqualToSuperview(padding: 16)
  /// ```
  @discardableResult
  func edgesEqualToSuperview(padding: CGFloat = .zero) -> [NSLayoutConstraint] {
    guard let superview else {
      return []
    }

    translatesAutoresizingMaskIntoConstraints = false

    let constraints = [
      leadingAnchor.constraint(
        equalTo: superview.leadingAnchor,
        constant: padding
      ),
      trailingAnchor.constraint(
        equalTo: superview.trailingAnchor,
        constant: -padding
      ),
      topAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.topAnchor,
        constant: padding
      ),
      bottomAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.bottomAnchor,
        constant: -padding
      )
    ]

    NSLayoutConstraint.activate(constraints)

    return constraints
  }

  /// Create and activate Auto Layout constraints to align the horizontal edges of the view with its superview's edges, optionally applying padding.
  ///
  /// This method simplifies the process of setting up constraints to make the view's horizontal edges match its superview's edges.
  /// It creates and activates constraints for the leading and trailing edges, ensuring alignment with the corresponding edges of its superview.
  /// An optional padding value can be provided to add space between the view's edges and the superview's edges.
  ///
  /// - Parameter padding: The padding value to apply to the leading and trailing edges. Default is zero.
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  /// - Note: The `translatesAutoresizingMaskIntoConstraints` property of the view is set to `false` within this method to ensure
  ///   compatibility with Auto Layout.
  ///
  /// - Warning: Using excessive padding values or very large numbers may result in unexpected layout issues.
  ///
  /// - Returns: An array of activated NSLayoutConstraint objects representing the created constraints.
  ///
  ///
  /// Example:
  /// ```
  /// let myFirstView = UIView()
  /// myFirstView.horizontalEdgesEqualToSuperview()
  ///
  /// let mySecondView = UIView()
  /// mySecondView.horizontalEdgesEqualToSuperview(padding: 16)
  /// ```
  @discardableResult
  func horizontalEdgesEqualToSuperview(padding: CGFloat = .zero) -> [NSLayoutConstraint] {
    guard let superview else {
      return []
    }

    translatesAutoresizingMaskIntoConstraints = false

    let constraints = [
      leadingAnchor.constraint(
        equalTo: superview.leadingAnchor,
        constant: padding
      ),
      trailingAnchor.constraint(
        equalTo: superview.trailingAnchor,
        constant: -padding
      ),
      topAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.topAnchor
      ),
      bottomAnchor.constraint(
        equalTo: superview.safeAreaLayoutGuide.bottomAnchor
      )
    ]

    NSLayoutConstraint.activate(constraints)

    return constraints
  }
}
