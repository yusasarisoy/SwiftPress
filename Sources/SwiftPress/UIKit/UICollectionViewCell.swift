import UIKit

public extension UICollectionViewCell {
  /// A unique identifier for the UICollectionViewCell instance.
  ///
  /// This property provides a convenient way to obtain a unique identifier for a
  /// `UICollectionViewCell` instance, typically used when registering and dequeuing cells
  /// in a UICollectionView. The identifier is based on the cell's class name.
  ///
  /// - Example:
  ///
  /// ```swift
  /// collectionView.register(
  ///   YourCustomCell.self,
  ///   forCellWithReuseIdentifier: YourCustomCell.identifier
  /// )
  ///
  /// ...
  ///
  /// guard let cell = collectionView.dequeueReusableCell(
  ///   withReuseIdentifier: YourCustomCell.identifier,
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
