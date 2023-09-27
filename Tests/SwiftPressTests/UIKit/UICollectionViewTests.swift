import XCTest
import UIKit
@testable import SwiftPress

final class UICollectionViewTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - dequeueReusableCell(withIdentifier:for:)

  func test_whenDequeueReusableCell_expectCellIsNotNil() {
    // Given
    let collectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: UICollectionViewFlowLayout()
    )

    collectionView.register(
      UICollectionViewCell.self, 
      forCellWithReuseIdentifier: "TestCellIdentifier"
    )

    let indexPath = IndexPath(item: .zero, section: .zero)

    // When
    let cell: UICollectionViewCell = collectionView.dequeueReusableCell(
      withIdentifier: "TestCellIdentifier",
      for: indexPath
    )

    // Then
    XCTAssertNotNil(cell)
  }

  // MARK: - registerCell(_:)

  func test_whenRegisterCell_expectCellIsNotNil() {
    // Given
    final class YourCustomCell: UICollectionViewCell { }

    let collectionView = UICollectionView(
      frame: CGRect.zero, 
      collectionViewLayout: UICollectionViewFlowLayout()
    )

    // When
    collectionView.registerCell(YourCustomCell.self)

    // Then
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: YourCustomCell.identifier,
      for: IndexPath(
        row: .zero,
        section: .zero
      )
    )

    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is YourCustomCell)
  }
}
