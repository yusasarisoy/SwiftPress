import Foundation

public extension FileManager {
  /// Retrieves the URL of the documents directory.
  ///
  /// Example:
  ///
  /// ```swift
  /// // Attempt to retrieve the documents directory URL using the FileManager extension.
  /// guard let documentsURL = FileManager.default.documentsDirectory() else {
  ///   print("Unable to access the documents directory.")
  ///   return
  /// }
  /// print("Documents Directory URL: \(documentsURL).")
  /// ```
  ///
  /// - Returns: A URL representing the documents directory if available, otherwise nil.
  func documentsDirectory() -> URL? {
    // Get an array of URLs for the document directory in the user's domain mask.
    let urls = urls(
      for: .documentDirectory,
      in: .userDomainMask
    )

    return urls.first
  }
}
