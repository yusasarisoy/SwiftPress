import XCTest

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

  // MARK: - centerInSuperview(priority:)

  func test_whenCenterInSuperview_expectTranslatesAutoresizingMaskIntoConstraintsIsFalse() {
    // When
    view.centerInSuperview()

    // Then
    XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
  }

  func test_whenCenterInSuperview_expectThereAreTwoConstraintsAndTheyMatchWithPreferredPriority() {
    // Given
    let customPriority: UILayoutPriority = .defaultHigh

    // When
    let constraints = view.centerInSuperview(priority: customPriority)

    // Then
    XCTAssertEqual(constraints.count, 2)

    constraints.forEach {
      XCTAssertEqual($0.priority, customPriority)
      XCTAssertTrue($0.isActive)
    }
  }

  // MARK: - centerYEqualTo(_ anchor:)

  func test_whenCenterYEqualToAnchor_expectConstraintIsActive() {
    // Given
    let anchorView = UIView()
    superview.addSubview(anchorView)

    // When
    guard let constraint = view.centerYEqualTo(anchorView.centerYAnchor) else {
      XCTFail("constraint property is nil.")
      return
    }

    // Then
    XCTAssertNotNil(constraint)
    XCTAssertTrue(constraint.isActive)
  }

  func test_whenCenterYEqualToAnchorWithoutSuperview_expectConstraintIsNil() {
    // Given
    view.removeFromSuperview()

    // When
    let constraint = view.centerYEqualTo(superview.centerYAnchor)

    // Then
    XCTAssertNil(constraint)
  }

  // MARK: - build(_:)

  func test_givenUILabelBuilderWhenConfiguringWithTextAndTextColor_expectPropertiesAreSet() {
    // Given
    let builder = UILabel()

    // When
    let titleLabel = builder.build {
      $0.text = "Hello, World!"
      $0.textColor = .darkText
    }

    // Then
    XCTAssertEqual(titleLabel.text, "Hello, World!")
    XCTAssertEqual(titleLabel.textColor, .darkText)
    XCTAssertFalse(titleLabel.translatesAutoresizingMaskIntoConstraints) // Should be false for UIView subclasses.
  }

  func test_givenUIButtonBuilderWhenConfiguringWithTitleAndTarget_expectPropertiesAreSet() {
    // Given
    let builder = UIButton()

    // When
    let submitButton = builder.build {
      $0.setTitle("Submit", for: .normal)
    }

    // Then
    XCTAssertEqual(submitButton.title(for: .normal), "Submit")
    XCTAssertFalse(submitButton.translatesAutoresizingMaskIntoConstraints) // Should be false for UIView subclasses.
  }

  // MARK: - addBorder(width:color:)

  func test_whenAddBorder_expectBorderPropertiesAreTrue() {
    // Given
    let testView = UIView()
    let borderWidth: CGFloat = 2
    let borderColor: UIColor = .red

    // When
    testView.addBorder(
      width: borderWidth,
      color: borderColor
    )

    // Then
    XCTAssertEqual(
      testView.layer.borderWidth, 
      borderWidth
    )
    XCTAssertEqual(
      testView.layer.borderColor,
      borderColor.cgColor
    )
  }

  func test_whenAddBorderWithMasksToBounds_expectBorderPropertiesAreTrue() {
    // Given
    let testView = UIView()
    let borderWidth: CGFloat = 2
    let borderColor: UIColor = .green

    // When
    testView.addBorder(
      width: borderWidth, 
      color: borderColor
    )
    testView.layer.masksToBounds = true

    // Then
    XCTAssertEqual(
      testView.layer.borderWidth, 
      borderWidth
    )
    XCTAssertEqual(
      testView.layer.borderColor,
      borderColor.cgColor
    )
  }

  // MARK: - addShadow(color:opacity:offset:radius:)

  func test_whenAddShadow_expectMasksToBoundsPropertyIsFalse() {
    // Given
    let view = MockView()

    // When
    view.addShadow(
      color: .red,
      opacity: 0.5,
      offset: CGSize(
        width: .zero,
        height: 3
      ),
      radius: 5
    )

    // Then
    XCTAssertFalse(
      view.layer.masksToBounds,
      "The 'masksToBounds' property should be set to 'false' to show the shadow."
    )
  }
}

// MARK: - MockView

final private class MockView: UIView {

  // MARK: - Properties

  var capturedShadowColor: CGColor?
  var capturedShadowOpacity: Float = 0
  var capturedShadowOffset: CGSize = .zero
  var capturedShadowRadius: CGFloat = 0

  // MARK: - Override Methods

  override var layer: CALayer {
    let layer = super.layer
    layer.masksToBounds = false
    return layer
  }

  override func draw(_ rect: CGRect) {
    capturedShadowColor = layer.shadowColor
    capturedShadowOpacity = layer.shadowOpacity
    capturedShadowOffset = layer.shadowOffset
    capturedShadowRadius = layer.shadowRadius
  }
}
