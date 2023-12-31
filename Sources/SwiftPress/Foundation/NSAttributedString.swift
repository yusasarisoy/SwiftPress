import UIKit

public extension NSAttributedString {
  /// Initializes an attributed string from an HTML string.
  ///
  /// - Parameter htmlString: The HTML string to convert to an attributed string.
  /// - Returns: An optional `NSAttributedString`. `nil` if initialization fails.
  ///
  /// - Note: This initializer uses HTML data and allows for specifying options
  ///         for document reading, such as document type and character encoding.
  ///
  /// - Example:
  ///
  /// ```swift
  /// let htmlString = "<p>This is a <b>bold</b> and <i>italic</i> text.</p>"
  /// guard let attributedString = NSAttributedString(htmlString: htmlString) else {
  ///   print("Failed to initialize NSAttributedString from HTML string.")
  ///   return
  /// }
  ///
  /// // Use the attributedString as needed.
  /// myLabel.attributedText = attributedString
  /// ```
  ///
  convenience init?(htmlString: String) {
    guard let data = htmlString.data(using: .utf8) else { return nil }

    do {
      let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
        .documentType: NSAttributedString.DocumentType.html,
        .characterEncoding: String.Encoding.utf8.rawValue
      ]
      try self.init(data: data, options: options, documentAttributes: nil)
    } catch {
      return nil
    }
  }

  /// Creates an attributed string with a specific font.
  ///
  /// - Parameters:
  ///   - font: The font to apply to the attributed string.
  /// - Returns: An attributed string with the specified font.
  ///
  /// Example:
  ///
  /// ```swift
  /// let originalString = "Hello, World!"
  /// let customFont: UIFont = .boldSystemFont(ofSize: 18)
  /// let attributedString = NSAttributedString(string: originalString).withFont(customFont)
  /// ```
  ///
  func withFont(_ font: UIFont) -> NSAttributedString {
    let mutableAttributedString = NSMutableAttributedString(attributedString: self)
    let range = NSRange(location: 0, length: mutableAttributedString.length)
    mutableAttributedString.addAttribute(.font, value: font, range: range)
    return NSAttributedString(attributedString: mutableAttributedString)
  }
}
