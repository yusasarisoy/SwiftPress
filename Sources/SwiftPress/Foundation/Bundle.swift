import Foundation

private enum BundleConstant {
  static let bundleVersion = "CFBundleShortVersionString"
}

public extension Bundle {
  /// Decodes JSON data from a file located in the app's bundle into a specified Swift type.
  ///
  /// - Parameters:
  ///   - type: The Swift type into which you want to decode the JSON data.
  ///   - file: The name of the JSON file (excluding the extension).
  ///   - fileExtension: The file extension of the JSON file (default is "json").
  ///
  /// - Returns: An instance of the specified Swift type decoded from the JSON data, or `nil` if decoding fails or the file is not found.
  ///
  /// - Example:
  ///
  /// ```swift
  ///
  /// // Example struct for the expected JSON structure.
  /// struct YourModel: Decodable {
  ///   let title: String
  ///   let message: String
  /// }
  ///
  /// // Using the extension to decode the JSON file.
  /// if let yourModel: YourModel = Bundle.main.decode(
  ///   YourModel.self,
  ///   from: "YourFile"
  /// ) {
  ///   // You can now use the decoded data.
  ///   print("Title: \(yourModel.title).")
  ///   print("Message: \(yourModel.message).")
  /// } else {
  ///   // Handle the case where the JSON file could not be loaded or decoded.
  ///   print("Failed to load or decode JSON file.")
  /// }
  /// ```
  ///
  func decode<Element: Decodable>(
    _ type: Element.Type,
    from file: String,
    withExtension fileExtension: String = "json"
  ) -> Element? {
    guard let url = self.url(
      forResource: file,
      withExtension: fileExtension
    ) else {
      return nil
    }

    do {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let data = try Data(contentsOf: url)
      let decodedObject = try? decoder.decode(Element.self, from: data)
      return decodedObject
    } catch {
      print("Error decoding JSON file \(file): \(error).")
      return nil
    }
  }

  /// Retrieves the app version number.
  ///
  /// - Returns: The app version number as a string.
  ///
  /// ## Example
  ///
  /// ```swift
  /// // Access the app version
  /// if let appVersion = Bundle.main.appVersion {
  ///   print("App Version: \(appVersion).")
  /// } else {
  ///   print("Unable to retrieve app version.")
  /// }
  /// ```
  ///
  var appVersion: String? {
    infoDictionary?[BundleConstant.bundleVersion] as? String
  }
}
