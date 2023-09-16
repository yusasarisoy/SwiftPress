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

  // MARK: - horizontalEdgesEqualToSuperview(padding:)

  func test_whenHorizontalEdgesEqualToSuperview_expectHorizontalConstraintsValuesAreTrue() {
    // Given
    let superview = UIView()
    let view = UIView()
    superview.addSubview(view)

    // When
    let constraints = view.horizontalEdgesEqualToSuperview(padding: 16)

    // Then
    XCTAssertEqual(constraints.count, 4)
    XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
    XCTAssertEqual(constraints[0].constant, 16)
    XCTAssertEqual(constraints[1].constant, -16)
  }

  func test_whenHorizontalEdgesEqualToSuperviewWithoutSuperview_expectThereIsNoContraints() {
    // Given
    let view = UIView()

    // When
    let constraints = view.horizontalEdgesEqualToSuperview(padding: 16)

    // Then
    XCTAssertEqual(constraints.count, 0)
  }

  // MARK: - heightEqualToWidth()

  func test_whenHeightEqualToWidth_expectConstraintIsActive() {
    // When
    guard let constraint = view.heightEqualToWidth() else {
      XCTFail("constraint property is nil.")
      return
    }

    // Then
    XCTAssertNotNil(constraint)
    XCTAssertTrue(constraint.isActive)
  }

  func test_whenHeightEqualToWidthWithoutSuperview_expectConstraintIsNil() {
    // Given
    view.removeFromSuperview()

    // When
    let constraint = view.heightEqualToWidth()

    // Then
    XCTAssertNil(constraint)
  }

  // MARK: - heightEqualTo(_:)

  func test_whenHeightEqualToConstant_expectConstraintIsActive() {
    // Given
    let constant: CGFloat = 50

    // When
    guard let constraint = view.heightEqualTo(constant) else {
      XCTFail("constraint property is nil.")
      return
    }

    // Then
    XCTAssertNotNil(constraint)
    XCTAssertTrue(constraint.isActive)
  }

  func test_whenHeightEqualToConstantWithoutSuperview_expectConstraintIsNil() {
    // Given
    view.removeFromSuperview()

    // When
    let constraint = view.heightEqualTo(50)

    // Then
    XCTAssertNil(constraint)
  }
}
