import UIKit

public extension UIImageView {
  /// Creates a custom UIImageView with specified properties.
  ///
  /// - Parameters:
  ///   - imageName: The name of the image to be displayed in the image view.
  ///   - contentMode: The content mode for displaying the image (default is `.scaleAspectFit`).
  ///
  /// Example:
  ///
  /// ```swift
  /// let customImageView = UIImageView.customImageView(
  ///   imageName: "exampleImage",
  ///   contentMode: .center
  /// )
  /// ```
  ///
  /// - Returns: A customized UIImageView instance.
  ///
  static func customImageView(
    imageName: String,
    contentMode: UIView.ContentMode = .scaleAspectFit
  ) -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage(named: imageName)
    imageView.contentMode = contentMode
    return imageView
  }
}
