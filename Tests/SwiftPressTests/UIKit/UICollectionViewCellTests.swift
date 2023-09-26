import XCTest
@testable import SwiftPress

final class UICollectionViewCellTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - identifier

  func testIdentifierPropertyGivenCustomCollectionViewCellWhenGettingIdentifier_expectShouldMatchClassName() {
    // Given
    final class TestCollectionViewCell: UICollectionViewCell {}
    let expectedIdentifier = "\(TestCollectionViewCell.self)"

    // When
    let identifier = TestCollectionViewCell.identifier

    // Then
    XCTAssertTrue(
      expectedIdentifier == identifier,
      "Cell identifier should match the class name."
    )
  }
}
