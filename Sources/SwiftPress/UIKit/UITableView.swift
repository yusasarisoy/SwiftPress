import UIKit

public extension UITableView {
  /// Dequeues a reusable cell of the specified type using the provided identifier for the given index path.
  ///
  /// - Parameters:
  ///   - identifier: A unique string identifier for the cell to dequeue.
  ///   - indexPath: The index path specifying the location of the cell in the table view.
  /// - Returns: An instance of the specified cell type, casted from the dequeued cell.
  ///
  /// This method safely dequeues a cell of the specified type using the given identifier and index path.
  /// If the dequeue operation is successful and the cell can be cast to the specified type, it returns
  /// the cell. If the dequeue or casting fails, it raises a fatal error.
  ///
  /// Example:
  ///
  /// ```swift
  /// let cell = tableView.dequeueReusableCell(
  ///   withIdentifier: "YourCellIdentifier",
  ///   for: indexPath
  /// )
  /// // Use 'cell' safely.
  /// ```
  ///
  /// - Note: Make sure that the identifier used matches the one set for the cell in the storyboard or
  ///   registered with the table view.
  ///
  /// - Warning: If the cast to the specified cell type fails, a fatal error will be triggered. Ensure
  ///   that the identifier and cell type are correctly specified to avoid crashes.
  ///
  /// - SeeAlso: `UITableViewCell`
  func dequeueReusableCell<Element: UITableViewCell>(
    withIdentifier identifier: String,
    for indexPath: IndexPath
  ) -> Element {
    guard let cell = dequeueReusableCell(
      withIdentifier: identifier,
      for: indexPath
    ) as? Element else {
      fatalError("Failed to dequeue cell with identifier: \(identifier).")
    }

    return cell
  }

  /// Register a UITableViewCell class with the table view.
  ///
  /// - Parameter cellClass: The UITableViewCell subclass to register.
  ///
  /// Example:
  ///
  /// ```swift
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
