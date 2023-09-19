import UIKit

/// An extension to UIColor that provides a convenient way to create UIColor instances
/// from hexadecimal color codes.
extension UIColor {
  /// Creates a UIColor instance from a hexadecimal color code.
  ///
  /// - Parameters:
  ///   - hex: A string representing the hexadecimal color code (e.g., "#FF5733").
  ///   - alpha: The alpha (opacity) value of the color (default is 1, fully opaque).
  ///
  /// - Returns: A UIColor instance created from the given hexadecimal color code.
  ///
  /// - Note: The `hex` parameter should include the "#" symbol followed by the
  ///   hexadecimal digits (e.g., "#FF5733"). The `alpha` parameter specifies the
  ///   opacity of the color, with a default value of 1 (fully opaque). The resulting
  ///   UIColor is ready to be used in interface elements such as UIView backgrounds or
  ///   text colors.
  ///
  /// - Example:
  ///
  ///   ```
  ///   // Create a UIColor instance from a hexadecimal color code
  ///   let customColor = UIColor(hex: "#FF5733")
  ///
  ///   // The 'customColor' variable now contains a UIColor instance representing
  ///   // the color specified by the hexadecimal code "#FF5733".
  ///   ```
  convenience init?(
    hex: String,
    alpha: CGFloat = 1
  ) {
    // Trim and sanitize the input hex string.
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: String.empty)

    // Ensure the sanitized hex string has a valid length (6 characters).
    guard hexSanitized.count == 6 else {
      return nil
    }

    // Parse the sanitized hex string into an unsigned 64-bit integer.
    var rgb: UInt64 = .zero

    Scanner(string: hexSanitized).scanHexInt64(&rgb)

    // Extract the red, green, and blue components from the hex value.
    let red = CGFloat((rgb & 0xFF0000) >> 16) / 255
    let green = CGFloat((rgb & 0x00FF00) >> 8) / 255
    let blue = CGFloat(rgb & 0x0000FF) / 255

    // Initialize the UIColor instance with the extracted components and the specified alpha.
    self.init(
      red: red, 
      green: green,
      blue: blue,
      alpha: alpha
    )
  }
}
