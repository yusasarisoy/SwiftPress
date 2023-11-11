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

  /// Deactivates an array of constraints.
  ///
  /// This method provides a convenient way to deactivate multiple constraints at once.
  ///
  /// - Parameter constraints: An array of constraints to deactivate.
  ///
  /// Example:
  ///
  /// ```swift
  /// // Assuming you have two views: view1 and view2
  ///
  /// // Creating a constraint that makes view1's leading edge equal to view2's leading edge
  /// let leadingConstraint = view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor)
  ///
  /// // Activating the constraint
  /// leadingConstraint.isActive = true
  ///
  /// // Later, if you want to deactivate the constraint
  /// leadingConstraint.isActive = false
  /// ```
  /// 
  static func deactivate(_ constraints: [NSLayoutConstraint]) {
    constraints.forEach { $0.isActive = false }
  }
}
