import XCTest
import UIKit
@testable import SwiftPress

final class UITableViewTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - registerCell(_:)

  func test_whenRegisterCell_expectCellIsNotNil() {
    // Given
    final class YourCustomCell: UITableViewCell { }

    let tableView = UITableView(frame: .zero)

    // When
    tableView.registerCell(YourCustomCell.self)

    // Then
    let cell = tableView.dequeueReusableCell(
      withIdentifier: YourCustomCell.identifier,
      for: IndexPath(
        row: .zero,
        section: .zero
      )
    )

    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is YourCustomCell)
  }
}
