import UIKit

public extension UITableViewCell {
  /// A unique identifier for the UITableViewCell instance.
  ///
  /// This property provides a convenient way to obtain a unique identifier for a
  /// `UITableViewCell` instance, typically used when registering and dequeuing cells
  /// in a UITableView. The identifier is based on the cell's class name.
  ///
  /// - Example:
  ///
  /// ```swift
  /// tableView.register(
  ///   YourCustomCell.self,
  ///   forCellReuseIdentifier: YourCustomCell.identifier
  /// )
  ///
  /// ...
  ///
  /// guard let cell = tableView.dequeueReusableCell(
  ///   withIdentifier: YourCustomCell.identifier,
  ///    for: indexPath
  /// ) as? YourCustomCell else {
  ///   return .init()
  /// }
  /// ```
  ///
  static var identifier: String {
    "\(self)"
  }
}
