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

  // MARK: - deactivate(_:)

  func test_whenDeactivate_shouldDeactivateConstraints() {
    // Given
    let view1 = UIView()
    let view2 = UIView()

    // Make view1 as the subview of view2
    view2.addSubview(view1)

    // Creating constraints
    let constraint1 = view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor)
    let constraint2 = view1.topAnchor.constraint(equalTo: view2.topAnchor)

    // Activating the constraints
    constraint1.isActive = true
    constraint2.isActive = true

    // Ensure the constraints are initially active
    XCTAssertTrue(constraint1.isActive, "Expected constraint1 to be initially active")
    XCTAssertTrue(constraint2.isActive, "Expected constraint2 to be initially active")

    // When
    NSLayoutConstraint.deactivate([constraint1, constraint2])

    // Then
    XCTAssertFalse(constraint1.isActive, "Expected constraint1 to be deactivated")
    XCTAssertFalse(constraint2.isActive, "Expected constraint2 to be deactivated")
  }

  func test_whenDeactivateAnEmptyArray_shouldNotCrash() {
    // Given
    let emptyConstraints: [NSLayoutConstraint] = []

    // When
    NSLayoutConstraint.deactivate(emptyConstraints)

    // Then
    XCTAssertTrue(true, "Deactivating an empty array should not crash")
  }
}
