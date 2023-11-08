import UIKit

public extension NSLayoutConstraint {
  /// Activates an array of Auto Layout constraints.
  ///
  /// This extension method simplifies the process of activating multiple constraints at once.
  ///
  /// - Parameter constraints: An array of constraints to activate.
  ///
  /// Example:
  ///
  /// ```swift
  /// let view1 = UIView()
  /// let view2 = UIView()
  ///
  /// // Create constraints (example constraints for illustration purposes)
  /// let leadingConstraint = view1.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 16.0)
  /// let topConstraint = view1.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 8.0)
  ///
  /// // Activate multiple constraints
  /// NSLayoutConstraint.activate([leadingConstraint, topConstraint])
  /// ```
  ///
  static func activate(_ constraints: [NSLayoutConstraint]) {
    constraints.forEach { $0.isActive = true }
  }
}
