import XCTest

final class BundleTests: XCTestCase {

  // MARK: - Test Setup
  
  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - decode(_:from:withExtension:)

  func test_whenDecodingInvalidJSON_expectAnInvalidJSON() {
    // Given
    let bundle = Bundle(for: type(of: self))
    let invalidJSON = "This is not valid JSON"
    let jsonFileName = "InvalidJSON"
    let jsonFilePath = bundle
      .bundleURL
      .appendingPathComponent(jsonFileName)
      .appendingPathExtension("json")
      .path

    do {
      try invalidJSON.write(
        toFile: jsonFilePath,
        atomically: true,
        encoding: .utf8
      )

      // When
      let decodedModel: MyModel? = bundle.decode(
        MyModel.self, 
        from: jsonFileName
      )

      // Then
      XCTAssertNil(decodedModel, "Decoding should fail for invalid JSON")
    } catch {
      XCTFail("Failed to create a test JSON file: \(error)")
    }
  }
  
  // MARK: - appVersion
  
  func test_whenCheckAppVersion_expectTheVersionIsCorrect() {
    // Given
    let mockInfoDictionary: [String: Any] = ["CFBundleShortVersionString": "1.0"]
    let mockBundle = MockBundle(infoDictionary: mockInfoDictionary)
    
    // When
    let appVersion = mockBundle.appVersion
    
    // Then
    XCTAssertEqual(appVersion, "1.0")
  }
  
  func test_whenCheckAppVersionForMissing_expectTheVersionIsNil() {
    // Given
    let mockInfoDictionary: [String: Any] = [:]
    let mockBundle = MockBundle(infoDictionary: mockInfoDictionary)
    
    // When
    let appVersion = mockBundle.appVersion
    
    // Then
    XCTAssertNil(appVersion)
  }
}

// MARK: - MyModel

struct MyModel: Decodable {
  let title: String
  let message: String
}

// MARK: - MockBundle

final class MockBundle: Bundle {

  // MARK: - Properties

  private let mockInfoDictionary: [String: Any]?

  // MARK: - Initialization

  init(infoDictionary: [String: Any]?) {
    mockInfoDictionary = infoDictionary

    super.init()
  }

  // MARK: - Override Methods

  override var infoDictionary: [String: Any]? {
    mockInfoDictionary
  }
}
