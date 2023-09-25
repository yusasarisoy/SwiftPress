import UIKit

public extension UICollectionView {
  /// Dequeues a reusable cell of the specified type using the provided identifier for the given index path.
  ///
  /// - Parameters:
  ///   - identifier: A unique string identifier for the cell to dequeue.
  ///   - indexPath: The index path specifying the location of the cell in the collection view.
  /// - Returns: An instance of the specified cell type, casted from the dequeued cell.
  ///
  /// This method safely dequeues a cell of the specified type using the given identifier and index path.
  /// If the dequeue operation is successful and the cell can be cast to the specified type, it returns
  /// the cell. If the dequeue or casting fails, it raises a fatal error.
  ///
  /// Example:
  ///
  /// ```
  /// let cell = collectionView.dequeueReusableCell(
  ///   withIdentifier: "YourCellIdentifier",
  ///   for: indexPath
  /// )
  /// // Use 'cell' safely.
  /// ```
  ///
  /// - Note: Make sure that the identifier used matches the one set for the cell in the storyboard or
  ///   registered with the collection view.
  ///
  /// - Warning: If the cast to the specified cell type fails, a fatal error will be triggered. Ensure
  ///   that the identifier and cell type are correctly specified to avoid crashes.
  ///
  /// - SeeAlso: `UICollectionViewCell`
  func dequeueReusableCell<Element: UICollectionViewCell>(
    withIdentifier identifier: String,
    for indexPath: IndexPath
  ) -> Element {
    guard let cell = dequeueReusableCell(
      withReuseIdentifier: identifier,
      for: indexPath
    ) as? Element else {
      fatalError("Failed to dequeue cell with identifier: \(identifier).")
    }

    return cell
  }
}
