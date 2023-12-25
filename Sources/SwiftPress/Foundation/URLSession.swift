import Foundation

public extension URLSession {

  enum NetworkError: Error {
    case invalidResponse
    case requestFailed(Error)
  }

  /// Performs an asynchronous data task with the given URL.
  ///
  /// - Parameters:
  ///   - url: The URL to request data from.
  /// - Returns: A tuple containing the fetched data and the URL response.
  /// - Throws: A `NetworkError` if the response is invalid or the request fails.
  ///
  /// ## Example
  ///
  /// ```swift
  /// do {
  ///   guard let url = URL(string: "https://example.com/data") else {
  ///     return
  ///   }
  ///
  ///   let (data, response) = try await URLSession.shared.asyncDataTask(with: url)
  ///
  ///   print("Response Status Code: \((response as! HTTPURLResponse).statusCode)")
  ///   print("Fetched Data: \(String(data: data, encoding: .utf8) ?? "")")
  /// } catch {
  ///   print("Error: \(error)")
  /// }
  /// ```
  ///
  func asyncDataTask(with url: URL) async throws -> (Data, URLResponse) {
    do {
      let (data, response) = try await data(from: url)

      guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
        throw NetworkError.invalidResponse
      }

      return (data, response)
    } catch {
      throw NetworkError.requestFailed(error)
    }
  }

  /// Performs an asynchronous JSON task with the given URL and decoding type.
  ///
  /// - Parameters:
  ///   - url: The URL to request JSON data from.
  ///   - decodingType: The type to decode the JSON into.
  /// - Returns: An instance of the specified decoding type.
  /// - Throws: An error if the data cannot be decoded or if the underlying data task fails.
  ///
  /// ## Example
  ///
  /// ```swift
  /// do {
  ///   guard let url = URL(string: "https://example.com/json") else {
  ///     return
  ///   }
  ///
  ///   struct MyModel: Decodable {
  ///     // Define your Decodable model structure here
  ///   }
  ///
  ///   let decodedModel = try await URLSession.shared.asyncJSONTask(with: url, decodingType: MyModel.self)
  ///   print("Decoded Model: \(decodedModel)")
  /// } catch {
  ///   print("Error: \(error)")
  /// }
  /// ```
  ///
  func asyncJSONTask<T: Decodable>(with url: URL, decodingType: T.Type) async throws -> T {
    do {
      let (data, _) = try await asyncDataTask(with: url)
      let decoder = JSONDecoder()
      return try decoder.decode(decodingType, from: data)
    } catch {
      throw error
    }
  }
}
