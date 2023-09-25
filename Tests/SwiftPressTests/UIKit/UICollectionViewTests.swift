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
}
