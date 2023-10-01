import XCTest
import UIKit
@testable import SwiftPress

final class UITableViewTests: XCTestCase {

  // MARK: - Properties

  var tableView: UITableView!

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()

    tableView = UITableView(frame: .zero)
  }

  override func tearDown() {
    tableView = nil

    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - dequeueReusableCell(withIdentifier:for:)

  func test_whenDequeueReusableCell_expectCellIsNotNil() {
    // Given
    tableView.registerCell(YourCustomCell.self)

    let indexPath = IndexPath(item: .zero, section: .zero)

    // When
    let cell: UITableViewCell = tableView.dequeueReusableCell(
      withIdentifier: YourCustomCell.identifier,
      for: indexPath
    )

    // Then
    XCTAssertNotNil(cell)
  }

  // MARK: - registerCell(_:)

  func test_whenRegisterCell_expectCellIsNotNil() {
    // When
    tableView.registerCell(YourCustomCell.self)

    let cell = tableView.dequeueReusableCell(
      withIdentifier: YourCustomCell.identifier,
      for: IndexPath(
        row: .zero,
        section: .zero
      )
    )

    // Then
    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is YourCustomCell)
  }
}

// MARK: - YourCustomCell

final class YourCustomCell: UITableViewCell { }
