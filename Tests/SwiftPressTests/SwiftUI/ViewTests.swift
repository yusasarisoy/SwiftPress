import XCTest
import SwiftUI
@testable import SwiftPress

final class ViewTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - if(_:content:)

  func test_whenIfConditionIsTrue_expectViewIsNotNil() {
    // Given
    let condition = true

    // When
    let view = Text("Hello")
      .if(condition) {
        Text("Condition is true.")
      }

    // Then
    XCTAssertNotNil(view)
  }

  func test_whenIfConditionIsFalse_expectViewIsNil() {
    // Given
    let condition = false

    // When
    let view = Text("Hello")
      .if(condition) {
        Text("Condition is false.")
      }

    // Then
    XCTAssertNotNil(view)
  }
}
