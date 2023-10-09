import UIKit

public extension UIApplication {
  /// Opens a URL if it can be handled by the app.
  ///
  /// This method allows you to attempt to open a URL with strict validation to ensure that the URL is valid and that the app can handle it before attempting to open it.
  ///
  /// - Parameter urlString: The string representation of the URL you want to open.
  ///
  /// - Returns: A boolean indicating whether the URL was successfully opened.
  ///
  /// Example:
  ///
  /// ```swift
  /// let urlString = "https://www.apple.com"
  /// if UIApplication.shared.openURL(urlString) {
  ///     // URL was opened successfully.
  /// } else {
  ///     // Failed to open the URL.
  /// }
  /// ```
  ///
  /// In the example above, the `openURL` method is used to open a website (https://www.apple.com) in the default web browser or another app that can handle web URLs.
  /// It ensures that the URL is valid and that the app can open it before attempting to do so, helping to prevent crashes or unexpected behavior.
  ///
  /// - Note: Make sure to handle potential errors or edge cases specific to your app's requirements when using this method.
  ///
  /// - Parameter urlString: The string representation of the URL you want to open.
  /// - Returns: A boolean indicating whether the URL was successfully opened.
  ///
  @discardableResult
  func openURL(_ urlString: String) -> Bool {
    guard let urlComponents = URLComponents(string: urlString),
          let _ = urlComponents.url,
          urlComponents.scheme != nil,
          let url = URL(string: urlString) else {
      return false
    }

    open(url, options: [:], completionHandler: nil)
    return true
  }
}
