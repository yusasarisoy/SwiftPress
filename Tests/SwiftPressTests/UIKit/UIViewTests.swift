import XCTest
@testable import SwiftPress

final class UIViewTests: XCTestCase {
  
  // MARK: - Properties
  
  private var superview: UIView!
  private var view: UIView!
  
  // MARK: - Test Setup
  
  override func setUp() {
    super.setUp()
    
    superview = UIView()
    view = UIView()
    superview.addSubview(view)
  }
  
  override func tearDown() {
    super.tearDown()
    
    superview = .none
    view = .none
  }
  
  // MARK: - Tests
  
  // MARK: - edgesEqualToSuperview(padding:)

  func test_whenEdgesEqualToSuperviewWithDefaultPadding_expectConstraintsAreActive() {
    // When
    let constraints = view.edgesEqualToSuperview()
    
    // Then
    XCTAssertNotNil(constraints)
    XCTAssertEqual(constraints.count, 4)
    
    for constraint in constraints {
      XCTAssertTrue(constraint.isActive)
      XCTAssertEqual(constraint.constant, 0)
    }
  }

  func test_whenEdgesEqualToSuperview_expectConstraintsAreTrue() {
    // Given
    let superview = UIView()
    superview.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

    let view = UIView()
    
    superview.addSubview(view)

    // When
    let constraints = view.edgesEqualToSuperview(padding: 16)

    // Then
    XCTAssertFalse(constraints.isEmpty)
    XCTAssertTrue(constraints.allSatisfy { $0.isActive })

    XCTAssertEqual(constraints.count, 4)
    XCTAssertEqual(constraints[0].constant, 16) // Leading
    XCTAssertEqual(constraints[1].constant, -16) // Trailing
    XCTAssertEqual(constraints[2].constant, 16) // Top
    XCTAssertEqual(constraints[3].constant, -16) // Bottom
  }
}
