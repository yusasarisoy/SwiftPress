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

  /// Creates a custom UIImageView with a circular shape and a border.
  ///
  /// - Parameters:
  ///   - image: The image to display in the image view.
  ///   - borderWidth: The width of the border (default is 2).
  ///   - borderColor: The color of the border (default is system gray).
  ///
  /// Example:
  ///
  /// ```swift
  /// let circularImage = UIImageView.circularImageView(
  ///   image: UIImage(named: "profile_image") ?? UIImage(),
  ///   borderWidth: 3,
  ///   borderColor: .blue
  /// )
  /// ```
  ///
  /// - Returns: A customized UIImageView instance with a circular shape and a border.
  ///
  static func circularImageView(
    image: UIImage,
    borderWidth: CGFloat = 2,
    borderColor: UIColor = .systemGray
  ) -> UIImageView {
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = imageView.frame.size.width / 2
    imageView.layer.borderWidth = borderWidth
    imageView.layer.borderColor = borderColor.cgColor
    return imageView
  }
}
