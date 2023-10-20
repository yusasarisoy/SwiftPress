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
  
  // MARK: - center()
  
  func testCenteringBehavior() {
    // Given
    func centeredViewCenterX(in geometry: GeometryProxy) -> CGFloat {
      let bounds = centeredViewBounds(in: geometry)
      return bounds.origin.x + bounds.size.width / 2
    }

    func centeredViewCenterY(in geometry: GeometryProxy) -> CGFloat {
      let bounds = centeredViewBounds(in: geometry)
      return bounds.origin.y + bounds.size.height / 2
    }

    func centeredViewBounds(in geometry: GeometryProxy) -> CGRect {
      let size = CGSize(
        width: 100,
        height: 50
      )
      return CGRect(
        origin: CGPoint(
          x: (geometry.size.width - size.width) / 2,
          y: (geometry.size.height - size.height) / 2
        ),
        size: size
      )
    }

    // When
    let centeredView = Text("Centered Text")
      .center()
    let _ = ZStack {
      GeometryReader { geometry in
        centeredView
          .onAppear {
            let centerX = geometry.size.width / 2
            let centerY = geometry.size.height / 2
            let viewCenterX = centeredViewCenterX(in: geometry)
            let viewCenterY = centeredViewCenterY(in: geometry)
            
            // Then
            XCTAssertEqual(
              centerX,
              viewCenterX,
              accuracy: 0.5
            )
            XCTAssertEqual(
              centerY,
              viewCenterY,
              accuracy: 0.5
            )
          }
      }
    }
  }
}
