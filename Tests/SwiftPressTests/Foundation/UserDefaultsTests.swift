import XCTest
@testable import SwiftPress

final class UserDefaultsTests: XCTestCase {

  // MARK: - Test Setup

  override func setUp() {
    super.setUp()

    guard let userDefaults = UserDefaults(suiteName: #file) else {
      return
    }
    userDefaults.removePersistentDomain(forName: #file)
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Tests

  // MARK: - getCustomObject(forKey:)

  func test_whenRetrievingValidObject_expectToBeNotNil() {
    // Given
    let person = Person(
      name: "Alice", 
      age: 30
    )

    // When
    UserDefaults.standard.setCustomObject(
      person,
      forKey: "personKey"
    )
    let retrievedPerson: Person? = UserDefaults.standard.getCustomObject(forKey: "personKey")

    // Then
    XCTAssertNotNil(retrievedPerson)
    XCTAssertEqual(retrievedPerson?.name, "Alice")
    XCTAssertEqual(retrievedPerson?.age, 30)
  }

  func test_whenRetrievingNonExistentObject_expectToBeNil() {
    // When
    let retrievedPerson: Person? = UserDefaults.standard.getCustomObject(forKey: "nonExistentKey")

    // Then
    XCTAssertNil(retrievedPerson)
  }

  // MARK: - setCustomObject(_:forKey:)

  func testStoringValidObject() {
    // Given
    let person = Person(
      name: "Alice", 
      age: 30
    )

    // When
    UserDefaults.standard.setCustomObject(
      person, 
      forKey: "personKey"
    )

    guard let storedData = UserDefaults.standard.data(forKey: "personKey") else {
      XCTFail()
      return
    }

    let decodedPerson = try? JSONDecoder().decode(
      Person.self,
      from: storedData
    )

    // Then
    XCTAssertNotNil(storedData)
    XCTAssertNotNil(decodedPerson)
    XCTAssertEqual(decodedPerson?.name, "Alice")
    XCTAssertEqual(decodedPerson?.age, 30)
  }

  func testOverwritingObject() {
    // Given
    let person1 = Person(
      name: "Alice",
      age: 30
    )
    let person2 = Person(
      name: "Bob",
      age: 25
    )

    // When
    UserDefaults.standard.setCustomObject(
      person1, 
      forKey: "personKey"
    )
    UserDefaults.standard.setCustomObject(
      person2,
      forKey: "personKey"
    )

    guard let storedData = UserDefaults.standard.data(forKey: "personKey") else {
      XCTFail()
      return
    }

    let decodedPerson = try? JSONDecoder().decode(
      Person.self,
      from: storedData
    )

    // Then
    XCTAssertNotNil(storedData)
    XCTAssertNotNil(decodedPerson)
    XCTAssertEqual(decodedPerson?.name, "Bob")
    XCTAssertEqual(decodedPerson?.age, 25)
  }
}

// MARK: - Person

struct Person: Codable {
  let name: String
  let age: Int
}
