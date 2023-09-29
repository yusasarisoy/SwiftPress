import XCTest
@testable import SwiftPress

final class UITableViewCellTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - identifier

  func testIdentifierPropertyGivenCustomTableViewCellWhenGettingIdentifier_expectShouldMatchClassName() {
    // Given
    final class TestTableViewCell: UITableViewCell {}
    let expectedIdentifier = "\(TestTableViewCell.self)"

    // When
    let identifier = TestTableViewCell.identifier

    // Then
    XCTAssertTrue(
      expectedIdentifier == identifier,
      "Cell identifier should match the class name."
    )
  }
}
