import UIKit

public extension UITableView {
  /// Register a UITableViewCell class with the table view.
  ///
  /// - Parameter cellClass: The UITableViewCell subclass to register.
  ///
  /// Example:
  ///
  /// ```
  /// let tableView = UITableView(frame: .zero)
  /// tableView.registerCell(YourCustomCell.self)
  /// ```
  ///
  /// This method registers a UITableViewCell class with the UITableView using the cell class itself as the reuse identifier.
  ///
  /// - Note: This method assumes that the UITableViewCell is created programmatically and does not require a separate XIB file.
  ///
  func registerCell<Element: UITableViewCell>(_ cellClass: Element.Type) {
    let cellIdentifier = Element.identifier
    register(
      cellClass,
      forCellReuseIdentifier: cellIdentifier
    )
  }
}
