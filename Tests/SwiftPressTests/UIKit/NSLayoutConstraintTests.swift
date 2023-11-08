import XCTest

final class NSLayoutConstraintTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - activate(_:)

  func test_whenActivateMethodIsCalledGivenArrayOfConstraints_thenConstraintsAreActivated() {
    // Given
    let superview = UIView()
    let view1 = UIView()
    let view2 = UIView()

    // Add view1 and view2 to the same superview
    superview.addSubview(view1)
    superview.addSubview(view2)

    let leadingConstraint = view1.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 16.0)
    let topConstraint = view1.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 8.0)
    let constraintsToActivate = [leadingConstraint, topConstraint]

    // When
    NSLayoutConstraint.activate(constraintsToActivate)

    // Then
    for constraint in constraintsToActivate {
      XCTAssertTrue(constraint.isActive, "Constraint should be activated")
    }
  }

  func test_whenActivateMethodIsCalledGivenEmptyArrayOfConstraints_thenConstraintsRemainInactive() {
    // Given
    let emptyConstraints: [NSLayoutConstraint] = []

    // When
    NSLayoutConstraint.activate(emptyConstraints)

    // Then
    for constraint in emptyConstraints {
      XCTAssertFalse(constraint.isActive, "Constraint should remain inactive")
    }
  }

  func test_whenActivateMethodIsCalledGivenNilConstraint_thenConstraintStaysNil() {
    // Given
    let nilConstraint: NSLayoutConstraint? = nil

    // When
    NSLayoutConstraint.activate([nilConstraint].compactMap { $0 })

    // Then
    XCTAssertNil(nilConstraint, "Nil constraint should remain nil")
  }
}
