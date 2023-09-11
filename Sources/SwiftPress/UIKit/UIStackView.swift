import UIKit

/// An extension to UIStackView that provides a convenient method to add subviews.
extension UIStackView {
  /// Adds an array of UIViews to the UIStackView as arranged subviews.
  ///
  /// - Parameter views: An array of UIViews to be added to the UIStackView.
  func addArrangedSubviews(_ views: [UIView]) {
    views.forEach { self.addArrangedSubview($0) }
  }
}
